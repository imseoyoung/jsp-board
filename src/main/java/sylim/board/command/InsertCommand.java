package sylim.board.command;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

import java.util.Date;
import java.util.List;

public class InsertCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");

        // 현재 시간을 초까지 포맷팅
        Date writeDate = new Date();

        BoardDAO boardDAO = new BoardDAO();

        int count = 0;
        int groups = 0;

        int step = 1;
        int indent = 0;

        BoardDTO board = new BoardDTO(0, title, content, writer, writeDate, count, groups, step, indent);
        boardDAO.insertBoard(board);

        return boardDAO.getAllBoard();
    }
}