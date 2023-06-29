package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.Date;
import java.util.List;

public class ReplyCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        String boardId = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");
        Date writeDate = new Date();
        int count = 0;

        // 원본 글 정보 가져오기
        BoardDAO dao = new BoardDAO();
        BoardDTO existingBoard = dao.getBoardById(boardId);

        int groups = existingBoard.getId();

        int step = existingBoard.getStep() + 1;
        int indent = existingBoard.getIndent() + 1;

        // 들여쓰기에 사용할 문자열 생성
        StringBuilder indentString = new StringBuilder();
        for (int i = 0; i < indent; i++) {
            indentString.append("..");
        }

        // 제목 앞에 들여쓰기 문자열 추가
        title = indentString.toString() + " " + title;

        BoardDTO board = new BoardDTO(0, title, content, writer, writeDate, count, groups, step, indent);
        dao.insertBoard(board);

        return dao.getAllBoard();
    }
}