package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.DTO.MessageDTO;
import com.DTO.MessageSet;
import com.DTO.ReplyDTO;
import com.Util.*;

/**
 * File : MessageDAO.java Desc : SNS �Խñ� Data Access Object Ŭ����
 * 
 * @author Ȳ����(dinfree@dinfree.com)
 *
 */
public class MessageDAO {
	Connection conn;
	PreparedStatement pst;
	Statement stmt;
	ResultSet rs;
	Logger logger = LoggerFactory.getLogger(MemberDAO.class);

	// close
	public void close() throws Exception {
		if (rs != null) rs.close();
		if (pst != null) pst.close();
		if (conn != null) conn.close();
	}

	public ArrayList<MessageSet> getAll(int cnt, String suid) throws Exception {
		ArrayList<MessageSet> datas = new ArrayList<MessageSet>();
		conn = DBManager.getConnection();
		String sql;

		try {
			// ��ü �Խù��� ���
			if ((suid == null) || (suid.equals(""))) {
				sql = "select * from (select * from Sales_Message order by mdate desc) where rownum between 1 and ?";
				pst = conn.prepareStatement(sql);
				pst.setInt(1, cnt);
			}
			// Ư�� ȸ�� �Խù� only �� ���
			else {
				sql = "select * from (select * from Sales_Message where email=? order by mdate desc) where rownum between 1 and ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, suid);
				pst.setInt(2, cnt);
			}

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				MessageSet ms = new MessageSet();
				MessageDTO m = new MessageDTO();
				ArrayList<ReplyDTO> rlist = new ArrayList<ReplyDTO>();

				m.setMid(rs.getInt("mid"));
				m.setMsg(rs.getString("msg"));
				m.setDate(rs.getString("mdate"));
				m.setFavcount(rs.getInt("favcount"));
				m.setEmail(rs.getString("email"));

				String rsql = "select *  from Sales_Reply where mid=? order by rdate desc";
				pst = conn.prepareStatement(rsql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pst.setInt(1, rs.getInt("mid"));
				ResultSet rrs = pst.executeQuery();
				while (rrs.next()) {
					ReplyDTO r = new ReplyDTO();
					r.setRid(rrs.getInt("rid"));
					r.setEmail(rrs.getString("email"));
					r.setRmsg(rrs.getString("rmsg"));
					r.setDate(rrs.getString("rdate"));
					rlist.add(r);
				}
				rrs.last();
				m.setReplycount(rrs.getRow());
				// System.out.println("r count"+rrs.getRow());

				ms.setMessage(m);
				ms.setRlist(rlist);
				datas.add(ms);
				rrs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getErrorCode());
			}
		}
		return datas;
	}

	/**
	 * �ű� �޽��� ���
	 * 
	 * @param msg
	 * @return
	 * @throws Exception
	 */
	public boolean newMsg(MessageDTO msg) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into Sales_Message(mid, email, msg, mdate) values(s_message_num.nextval, ?, ?, to_char(sysdate, 'YYYY-MM-DD / HH24:MI'))";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, msg.getEmail());
			pst.setString(2, msg.getMsg());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	/**
	 * �޽��� ����
	 * 
	 * @param mid
	 * @return
	 * @throws Exception
	 */
	public boolean delMsg(int mid) throws Exception {
		conn = DBManager.getConnection();
		String sql = "delete from Sales_Message where mid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, mid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	/**
	 * �Խñۿ� ���� ��� ���, �� �Խù��� ���� mid �ʿ�
	 * 
	 * @param mid
	 * @param rmsg
	 * @return
	 * @throws Exception
	 */
	public boolean newReply(ReplyDTO reply) throws Exception {
		conn = DBManager.getConnection();
		String sql = "insert into Sales_Reply(rid,mid,email,rmsg,rdate) values(s_reply_num.nextval,?,?,?,to_char(sysdate, 'YYYY-MM-DD'))";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, reply.getMid());
			pst.setString(2, reply.getEmail());
			pst.setString(3, reply.getRmsg());
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	/**
	 * ��� ����
	 * 
	 * @param rid
	 * @return
	 * @throws Exception
	 */
	public boolean delReply(int rid) throws Exception {
		conn = DBManager.getConnection();
		String sql = "delete from Sales_Reply where rid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
			return false;
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return true;
	}

	/**
	 * ���ƿ� �߰�
	 * 
	 * @param mid
	 * @throws Exception
	 */
	public void favorite(int mid) throws Exception {
		conn = DBManager.getConnection();
		// ���ƿ� �߰��� ���� favcount �� +1 �ؼ� update ��
		String sql = "update Sales_Message set favcount=favcount+1 where mid=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, mid);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} finally {
			try {
				close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
