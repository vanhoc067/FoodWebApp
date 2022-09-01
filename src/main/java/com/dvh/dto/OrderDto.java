/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.dto;

/**
 *
 * @author thinh
 */
public class OrderDto {
    private String productName;
	private float subtotal;
//	private float shipping;
//        private float quantity;
	private float total;
	
	public OrderDto() {
		super();
	}

	public OrderDto(String productName, String subtotal, String total) {
		super();
		this.productName = productName;
		this.subtotal = Float.parseFloat(subtotal);
//		this.shipping = Float.parseFloat(shipping);
//                this.quantity = Float.parseFloat(quantity);
		this.total = Float.parseFloat(total);
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSubtotal() {
		return String.format("%.2f", this.subtotal);
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

//	public String getShipping() {
//		return String.format("%.2f", this.shipping);
//	}
//
//	public void setShipping(float shipping) {
//		this.shipping = shipping;
//	}

	public String getTotal() {
		return String.format("%.2f", this.total);
	}

	public void setTotal(float total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrderDetail [productName=" + productName + ", subtotal=" + subtotal
				+ ", total=" + total + "]";
	}

    /**
     * @return the quantity
     */
//    public float getQuantity() {
//        return quantity;
//    }
//
//    /**
//     * @param quantity the quantity to set
//     */
//    public void setQuantity(float quantity) {
//        this.quantity = quantity;
//    }

   
}
