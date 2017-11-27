package mysns.sns;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.DAO.MemberDAO;
import mysns.util.*;

/**
 * File : MessageDAO.java
 * Desc : SNS �Խñ� Data Access Object Ŭ����
 * @author Ȳ����(dinfree@dinfree.com)
 *
 */
public class MessageDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	public ArrayList<MessageSet> getAll(int cnt, String suid) throws Exception {
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		conn = DBManager.getConnection();
		String sql;

		
		try {
			// ��ü �Խù��� ���
			if((suid == null) || (suid.equals(""))) {
				sql = "select * from (select * from s_message order by mdate desc) where rownum between 1 and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cnt);
			}
			// Ư�� ȸ�� �Խù� only �� ���
			else{
				sql = "select * from (select * from s_message where email=? order by mdate desc) where rownum between 1 and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,suid);
				pstmt.setInt(2,cnt);
			}

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MessageSet ms = new MessageSet();
				Message m = new Message();
				ArrayList<Reply> rlist = new ArrayList<Reply>();
				
				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setDate(rs.getString("mdate"));
				m.setFavcount(rs.getInt("favcount"));
				m.setEmail(rs.getString("email"));
				
				String rsql = "select *  from s_reply where mid=? order by rdate desc";
				pstmt = conn.prepareStatement(rsql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setInt(1,rs.getInt("mid"));
				ResultSet rrs = pstmt.executeQuery();
				while(rrs.next()) {
					Reply r = new Reply();
					r.setRid(rrs.getInt("rid"));
					r.setEmail(rrs.getString("email"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setDate(rrs.getString("rdate"));
					rlist.add(r);
				}
				rrs.last();
				m.setReplycount(rrs.getRow());
				//System.out.println("r count"+rrs.getRow());
				
				ms.setMessage(m);
				ms.setRlist(rlist);
				datas.add(ms);
				rrs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		}
		finally {
			try {
				//rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}		
		return datas;
	}
	
	/**
	 * �ű� �޽��� ���
	 * @param msg
	 * @return
	 * @throws Exception 
	 */
	public boolean newMsg(Message msg) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into s_message(mid, email, msg, mdate) values(s_message_num.nextval, ?, ?, to_char(sysdate, 'YYYY-MM-DD / HH24:MI'))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, msg.getEmail());
			pstmt.setString(2, msg.getMsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
}
	
	/**
	 * �޽��� ����
	 * @param mid
	 * @return
	 * @throws Exception 
	 */
	public boolean delMsg(int mid) throws Exception {
		conn = DBManager.getConnection();
		String sql = "delete from s_message where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;	
	}
		
	/**
	 * �Խñۿ� ���� ��� ���, �� �Խù��� ���� mid �ʿ�
	 * @param mid
	 * @param rmsg
	 * @return
	 * @throws Exception 
	 */
	public boolean newReply(Reply reply) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into s_reply(rid,mid,email,rmsg,rdate) values(s_reply_num.nextval,?,?,?,to_char(sysdate, 'YYYY-MM-DD'))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply.getMid());
			pstmt.setString(2, reply.getEmail());
			pstmt.setString(3, reply.getRmsg());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * ��� ����
	 * @param rid
	 * @return
	 * @throws Exception 
	 */
	public boolean delReply(int rid) throws Exception {
		conn = DBManager.getConnection();
		String sql = "delete from s_reply where rid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rid);;
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * ���ƿ� �߰�
	 * @param mid
	 * @throws Exception 
	 */
	public void favorite(int mid) throws Exception {
		conn = DBManager.getConnection();
		// ���ƿ� �߰��� ���� favcount �� +1 �ؼ� update ��
		String sql = "update s_message set favcount=favcount+1 where mid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		}
		finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
