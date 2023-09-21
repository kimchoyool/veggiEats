package com.java.veggieats.board.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardDTO {
    private int board_id;
    private String member_id;
    private String title;
    private String content;
    private String create_date;
    private String update_date;
    private MultipartFile uploadFile;
}
