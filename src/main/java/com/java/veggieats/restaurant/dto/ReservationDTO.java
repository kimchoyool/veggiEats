package com.java.veggieats.restaurant.dto;

import lombok.Data;

@Data
public class ReservationDTO {
    private String reservationNo;
    private String memberId;
    private String restaurantId;
    private String reservationDate;
    private String reservationTime;
    private int people;
    private int deposit;
    private String state;
    private String restaurantName;

    //ReservationRepository에서 @Query new...를 사용한다면 롬복을 사용하더라도 명시적 생성자를 추가해야 한다.
    public ReservationDTO(String reservationNo, int people, String state, String restaurantName) {
        this.reservationNo = reservationNo;
        this.people = people;
        this.state = state;
        this.restaurantName = restaurantName;
    }
}
