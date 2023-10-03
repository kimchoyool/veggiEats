package com.java.veggieats.restaurant.dto;

import lombok.Data;
import lombok.Setter;

import javax.persistence.Column;
import java.time.LocalDate;
import java.time.LocalTime;

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
}
