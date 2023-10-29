package com.java.veggieats.restaurant.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@NoArgsConstructor
@Entity(name = "restaurant")
@Getter
@DynamicUpdate
public class RestaurantEntity {
    @Id
    @Column(name = "restaurant_id")
    private String restaurantId;
    @Column(name = "restaurant_password")
    private String restaurantPassword;
    @Column(name = "restaurant_name")
    private String restaurantName;
    private String position;
    private String phone;

    @OneToOne(mappedBy = "restaurant")
    private ReservationEntity reservation;

    @Builder
    public  RestaurantEntity(String restaurantId, String restaurantPassword,
                             String restaurantName, String position, String phone, ReservationEntity reservation){
        this.restaurantId = restaurantId;
        this.restaurantPassword = restaurantPassword;
        this.restaurantName = restaurantName;
        this.position = position;
        this.phone = phone;
        this.reservation = reservation;
    }
}
