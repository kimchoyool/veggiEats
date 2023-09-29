package com.java.veggieats.board.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor
@Entity(name = "board_image")
@Getter
public class BoardImageEntity {
    @Id
    @Column(name = "board_id")
    private Long boardId;
    @Column(name = "image_file")
    private String imageFile;

    @Builder
    public BoardImageEntity(Long boardId, String imageFile){
        this.boardId = boardId;
        this.imageFile = imageFile;
    }
}
