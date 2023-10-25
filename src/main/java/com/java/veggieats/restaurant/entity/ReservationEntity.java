package com.java.veggieats.restaurant.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;
import java.time.LocalTime;

@NoArgsConstructor
@Entity(name = "reservation")
@Getter
@DynamicUpdate
public class ReservationEntity {
    @Id
    @Column(name = "reservation_no")
    private String reservationNo;
    @Column(name = "member_id")
    private String memberId;
    @Column(name = "restaurant_id")
    private String restaurantId;
    @Column(name = "reservation_date")
    private LocalDate reservationDate;
    @Column(name = "reservation_time")
    private String reservationTime;
    private int people;
    private int deposit;
    @Setter
    private String state;

    @Builder
    public ReservationEntity(String reservationNo, String memberId, String restaurantId,
                             LocalDate reservationDate, String reservationTime,
                             int people, int deposit, String state){
        this.reservationNo = reservationNo;
        this.memberId = memberId;
        this.restaurantId = restaurantId;
        this.reservationDate = reservationDate;
        this.reservationTime = reservationTime;
        this.people = people;
        this.deposit = deposit;
        this.state = state;
    }

}
