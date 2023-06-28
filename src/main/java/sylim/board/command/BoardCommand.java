package sylim.board.command;

import java.util.List;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.daodto.BoardDTO;

public interface BoardCommand {
    
    public List<BoardDTO> execute(HttpServletRequest request, HttpServletResponse response);

}
