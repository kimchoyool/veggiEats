package com.java.veggieats.board.controller;

import com.java.veggieats.board.dto.BoardDTO;
import com.java.veggieats.board.entity.BoardEntity;
import com.java.veggieats.board.entity.BoardImageEntity;
import com.java.veggieats.board.repository.BoardRepository;
import com.java.veggieats.common.FileUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
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

    @GetMapping(value = "BoardWrite")
    public String boardWriteGet(){
        return"/board_write";
    }

    @PostMapping(value = "BoardWrite")
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
}
