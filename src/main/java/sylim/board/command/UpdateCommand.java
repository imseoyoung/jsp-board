package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.List;

public class UpdateCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        // 폼으로부터 전달된 수정할 게시글의 정보를 받아옵니다.
        String boardId = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");

        // 기존의 게시글 정보를 가져옵니다.
        BoardDAO dao = new BoardDAO();
        BoardDTO existingBoard = dao.getBoardById(boardId);

        // 수정할 게시글을 생성합니다.
        BoardDTO updatedBoard = new BoardDTO(
                existingBoard.getId(),
                title,
                content,
                writer,
                existingBoard.getWriteDate(),
                existingBoard.getCount(),
                existingBoard.getGroups(),
                existingBoard.getStep(),
                existingBoard.getIndent()
        );

        // DAO를 사용하여 게시글을 업데이트합니다.
        dao.updateBoard(updatedBoard);

        // 게시글 목록을 조회하여 반환합니다. (업데이트 이후 최신 목록으로 갱신)
        List<BoardDTO> boardList = dao.getAllBoard();
        return boardList;
    }
}
