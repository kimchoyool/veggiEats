package com.java.veggieats.board.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor
@Entity(name = "board_image")
@Getter
public class BoardImageEntity {
    @Id
    private Long board_id;
    private String image_file;

    @Builder
    public BoardImageEntity(Long board_id, String image_file){
        this.board_id = board_id;
        this.image_file = image_file;
    }
}
