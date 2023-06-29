package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.List;

public class DeleteMultipleCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        // 선택된 게시글의 ID 배열을 파라미터로부터 가져옴
        String[] boardIds = request.getParameterValues("selectedIds");

        // DAO를 사용하여 선택된 게시글들을 삭제
        BoardDAO dao = new BoardDAO();
        dao.deleteMultipleBoards(boardIds);

        // 삭제 후 게시글 목록을 조회하여 반환
        List<BoardDTO> boardList = dao.getAllBoard();
        return boardList;
    }
}
