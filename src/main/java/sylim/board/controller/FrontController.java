package sylim.board.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sylim.board.command.BoardCommand;
import sylim.board.command.DeleteCommand;
import sylim.board.command.DeleteMultipleCommand;
import sylim.board.command.SelectCommand;
import sylim.board.command.UpdateCommand;
import sylim.board.command.ViewCommand;
import sylim.board.command.InsertCommand;
import sylim.board.command.ReplyCommand;
import sylim.board.daodto.BoardDAO;
import sylim.board.daodto.BoardDTO;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String viewPage = null;
        BoardCommand cmd = null;

        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String command = uri.substring(conPath.length());

        switch (command) {
            case "/select_board.do":
                cmd = new SelectCommand();
                List<BoardDTO> boardList = cmd.execute(request, response);
                request.setAttribute("boardList", boardList);
                viewPage = "boardList.jsp";
                break;
            case "/insert_board.do":
                viewPage = "insertboard.jsp";
                break;
            case "/insert_confirm.do":
                cmd = new InsertCommand();
                cmd.execute(request, response);
                viewPage = "insertconfirm.jsp";
                break;
            case "/view_board.do":
                cmd = new ViewCommand();
                List<BoardDTO> viewBoardList = cmd.execute(request, response);
                BoardDTO board = viewBoardList.get(0);
                request.setAttribute("board", board);
                viewPage = "viewboard.jsp";
                break;
            case "/update_board.do":
                cmd = new ViewCommand();
                List<BoardDTO> updateBoardList = cmd.execute(request, response);
                BoardDTO updateBoard = updateBoardList.get(0);
                request.setAttribute("board", updateBoard);
                viewPage = "updateboard.jsp";
                break;
            case "/update_confirm.do":
                cmd = new UpdateCommand();
                cmd.execute(request, response);
                viewPage = "updateconfirm.jsp";
                break;
            case "/delete_board.do":
                cmd = new DeleteCommand();
                cmd.execute(request, response);
                viewPage = "deleteconfirm.jsp";
                break;
            case "/delete_multiple.do":
                cmd = new DeleteMultipleCommand();
                List<BoardDTO> deletedBoardList = cmd.execute(request, response);
                request.setAttribute("boardList", deletedBoardList);
                cmd.execute(request, response);
                viewPage = "deleteconfirm.jsp";
                break;
            case "/reply_board.do":
                cmd = new ViewCommand();
                List<BoardDTO> replyBoardList = cmd.execute(request, response);
                BoardDTO replyBoard = replyBoardList.get(0);
                request.setAttribute("board", replyBoard);
                viewPage = "replyboard.jsp";
                break;
            case "/reply_confirm.do":
                cmd = new ReplyCommand();
                List<BoardDTO> updatedBoardList = cmd.execute(request, response);
                request.setAttribute("boardList", updatedBoardList);
                viewPage = "replyconfirm.jsp";
                break;
            default:
                // 다른 요청에 대한 처리 (예: 에러 페이지 등)
                viewPage = "error.jsp";
                break;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
        dispatcher.forward(request, response);
    }
}