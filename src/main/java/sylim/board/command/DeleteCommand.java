package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.List;

public class DeleteCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        // 삭제할 글의 ID를 파라미터로부터 가져옴
        String boardId = request.getParameter("id");

        // DAO를 사용하여 해당 글을 삭제
        BoardDAO dao = new BoardDAO();
        dao.deleteBoard(boardId);

        // 삭제 후 게시글 목록을 조회하여 반환
        List<BoardDTO> boardList = dao.getAllBoard();
        return boardList;
    }
}
