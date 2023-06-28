package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.ArrayList;
import java.util.List;

public class ViewCommand implements BoardCommand {
    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        // 글의 ID를 파라미터로부터 가져옴
        String boardId = request.getParameter("id");

        // DAO를 사용하여 해당 글의 정보를 조회
        BoardDAO dao = new BoardDAO();
        BoardDTO board = dao.getBoardById(boardId);

        // 조회된 글의 count 값을 증가시킴
        int count = board.getCount() + 1;
        board.setCount(count);

        // 게시글의 count 값을 데이터베이스에 업데이트
        dao.updateBoardCount(board);

        // 조회된 글을 List에 담아서 반환
        List<BoardDTO> boardList = new ArrayList<>();
        boardList.add(board);
        return boardList;
    }
}