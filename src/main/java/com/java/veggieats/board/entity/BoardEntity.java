package com.java.veggieats.board.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.time.LocalDateTime;

@NoArgsConstructor
@Entity(name="board")
@Getter
public class BoardEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long board_id;
    private String member_id;
    private String title;
    private String content;
    @CreationTimestamp
    private LocalDateTime create_date;
    @CreationTimestamp
    private LocalDateTime update_date;

    @Builder
    public BoardEntity(Long board_id, String member_id, String title, String content, LocalDateTime create_date, LocalDateTime update_date){
        this.board_id = board_id;
        this.member_id = member_id;
        this.title = title;
        this.content = content;
        this.create_date = create_date;
        this.update_date = update_date;
    }
}
