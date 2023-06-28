package sylim.board.command;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;

public class SelectCommand implements BoardCommand {

    @Override
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response) {
        BoardDAO boardDAO = new BoardDAO();
        List<BoardDTO> boardList = boardDAO.getAllBoard();
        return boardList;
    }
}
