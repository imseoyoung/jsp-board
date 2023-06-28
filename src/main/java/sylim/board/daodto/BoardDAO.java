package sylim.board.daodto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import sylim.board.daodto.BoardDTO;

public class BoardDAO {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    
    public BoardDAO() {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
        } catch(Exception e) {
            e.printStackTrace();       
        }
    }
    
    public void updateBoardCount(BoardDTO board) {
        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                     "UPDATE BOARD SET count = ? WHERE id = ?")
        ) {
            pstmt.setInt(1, board.getCount());
            pstmt.setInt(2, board.getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public BoardDTO getBoardById(String boardId) {
        BoardDTO board = null;

        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM BOARD WHERE id = ?")
        ) {
            pstmt.setString(1, boardId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    String writer = rs.getString("writer");
                    Date writeDate = rs.getDate("write_date");
                    int count = rs.getInt("count");
                    int groups = rs.getInt("groups");
                    int step = rs.getInt("step");
                    int indent = rs.getInt("indent");

                    board = new BoardDTO(id, title, content, writer, writeDate, count, groups, step, indent);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return board;
    }


    public List<BoardDTO> getAllBoard() {
        List<BoardDTO> boardList = new ArrayList<>();

        try (Connection conn = ds.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM BOARD ORDER BY GROUPS, STEP")
        ) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String writer = rs.getString("writer");
                Date writeDate = rs.getDate("write_date");
                int count = rs.getInt("count");
                int groups = rs.getInt("groups");
                int step = rs.getInt("step");
                int indent = rs.getInt("indent");

                BoardDTO board = new BoardDTO(id, title, content, writer, writeDate, count, groups, step, indent);
                boardList.add(board);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return boardList;
    }

    public void insertBoard(BoardDTO board) {
        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                     "INSERT INTO BOARD (id, title, content, writer, write_date, count, groups, step, indent) " +
                     "VALUES (id_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)")
        ) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getWriter());
            pstmt.setDate(4, new java.sql.Date(board.getWriteDate().getTime()));
            pstmt.setInt(5, board.getCount());
            pstmt.setInt(6, board.getGroups());
            pstmt.setInt(7, board.getStep());
            pstmt.setInt(8, board.getIndent());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void updateBoard(BoardDTO board) {
        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                     "UPDATE BOARD SET title = ?, content = ?, writer = ? WHERE id = ?")
        ) {
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getWriter());
            pstmt.setInt(4, board.getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteBoard(String boardId) {
        try (Connection conn = ds.getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM BOARD WHERE id = ?")
        ) {
            pstmt.setString(1, boardId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
}