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
    @Column(name = "board_id")
    private Long boardId;
    @Column(name = "member_id")
    private String memberId;
    private String title;
    private String content;
    @CreationTimestamp
    @Column(name = "create_date")
    private LocalDateTime createDate;
    @CreationTimestamp
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    @Builder
    public BoardEntity(Long boardId, String memberId, String title, String content, LocalDateTime createDate, LocalDateTime updateDate){
        this.boardId = boardId;
        this.memberId = memberId;
        this.title = title;
        this.content = content;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
}
