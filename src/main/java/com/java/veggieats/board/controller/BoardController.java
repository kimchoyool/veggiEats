package com.java.veggieats.board.controller;

import com.java.veggieats.board.dto.BoardDTO;
import com.java.veggieats.board.entity.BoardEntity;
import com.java.veggieats.board.entity.BoardImageEntity;
import com.java.veggieats.board.repository.BoardRepository;
import com.java.veggieats.common.FileUtils;
import lombok.RequiredArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class BoardController {
    private final BoardRepository boardRepository;

    @GetMapping(value = "/boardList")
    public String getBoardList(ModelMap model){
        model.addAttribute("boardList", boardRepository.findAll());
        return"/board_list";
    }

    @GetMapping(value = "/board")
    public  String getBoard(BoardDTO board, ModelMap model, HttpServletRequest request){

        if(request.getParameter("no") != null) {
            //board.setBoard_id(Integer.parseInt(request.getParameter("no")));
        }
        model.addAttribute("board", boardRepository.findById(Long.valueOf(request.getParameter("no"))));

        return"/board";
    }

    @GetMapping(value = "/boardWrite")
    public String boardWriteGet(){
        return"/board_write";
    }

    @PostMapping(value = "/boardWrite")
    public String boardWritePost(BoardDTO board, HttpServletRequest request) throws Exception, IOException{
        HttpSession session = request.getSession();
        BoardEntity boardEntity = BoardEntity.builder()
                .member_id((String) session.getAttribute("ID"))
                .title(board.getTitle())
                .build();
        BoardEntity entity = boardRepository.save(boardEntity);

        //파일 업로드
        MultipartFile uploadFile = board.getUploadFile();
        if(!uploadFile.isEmpty()){
            String uuid = UUID.randomUUID().toString();
            Path targetPath = FileUtils.saveFile(uploadFile,uuid);
            BoardImageEntity image = BoardImageEntity.builder()
                    .board_id(entity.getBoard_id())
                    .image_file(targetPath.toString())
                    .build();
        }

        return"redirect:boardList";
    }

    @GetMapping(value = "/updateBoard")
    public String updateBoardGet(@RequestParam("no") long no, Model model){
        model.addAttribute("board", boardRepository.existsById(no));
        return "/board_update";
    }
    @PostMapping(value = "/updateBoard")
    public String updateBoardPost(@RequestBody BoardDTO boardDTO, Model model){
        BoardEntity board = BoardEntity.builder()
                .board_id((long) boardDTO.getBoard_id())
                .title(boardDTO.getTitle())
                .content(boardDTO.getContent())
                .member_id(boardDTO.getMember_id())
                .build();

        return "redirect:boardList";
    }
    @GetMapping(value = "/deleteBoard")
    public String deleteBoard(@RequestParam("no") long no, HttpSession session){
        //되는지 확인
        BoardEntity board = BoardEntity.builder()
                .board_id(no)
                .member_id((String) session.getAttribute("ID"))
                .build();
        boardRepository.deleteById(no);
        return "redirect:boardList";
    }
}
