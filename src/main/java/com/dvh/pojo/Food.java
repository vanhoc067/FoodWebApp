/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dvh.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.mail.Multipart;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author thinh
 */
@Entity
@Table(name = "food")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Food.findAll", query = "SELECT f FROM Food f"),
    @NamedQuery(name = "Food.findById", query = "SELECT f FROM Food f WHERE f.id = :id"),
    @NamedQuery(name = "Food.findByName", query = "SELECT f FROM Food f WHERE f.name = :name"),
    @NamedQuery(name = "Food.findByQuantity", query = "SELECT f FROM Food f WHERE f.quantity = :quantity"),
    @NamedQuery(name = "Food.findByStatus", query = "SELECT f FROM Food f WHERE f.status = :status"),
    @NamedQuery(name = "Food.findByDescription", query = "SELECT f FROM Food f WHERE f.description = :description"),
    @NamedQuery(name = "Food.findByTimeSelling", query = "SELECT f FROM Food f WHERE f.timeSelling = :timeSelling"),
    @NamedQuery(name = "Food.findByImage", query = "SELECT f FROM Food f WHERE f.image = :image"),
    @NamedQuery(name = "Food.findByPrice", query = "SELECT f FROM Food f WHERE f.price = :price")})
public class Food implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "{food.name.err}")
    @Size(min = 1, max = 255, message = "{food.name.err}")
    @Column(name = "name")
    private String name;
    @Column(name = "quantity")
    private Integer quantity;
    @Basic(optional = false)
    @Size(min = 1, max = 45)
    @Column(name = "status")
    private String status;
    @Size(max = 255)
    @Column(name = "description")
    private String description;
    @Column(name = "time_selling")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeSelling;
    @Size(max = 200)
    @Column(name = "image")
    private String image;
    @Column(name = "price")
    @Min(value = 10000, message = "{food.price.errMin}")
    @Max(value = 500000, message = "{food.price.errMax}")
    private Long price;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "foodId")
    @JsonIgnore
    private Set<Comment> commentSet;
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Category categoryId;
    @JoinColumn(name = "store_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Store storeId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "foodId")
    @JsonIgnore
    private Set<Orderdetail> orderdetailSet;
    @Transient
    private MultipartFile file;

    public Food() {
    }

    public Food(Integer id) {
        this.id = id;
    }

    public Food(Integer id, String name, String status) {
        this.id = id;
        this.name = name;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTimeSelling() {
        return timeSelling;
    }

    public void setTimeSelling(Date timeSelling) {
        this.timeSelling = timeSelling;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public Store getStoreId() {
        return storeId;
    }

    public void setStoreId(Store storeId) {
        this.storeId = storeId;
    }

    @XmlTransient
    public Set<Orderdetail> getOrderdetailSet() {
        return orderdetailSet;
    }

    public void setOrderdetailSet(Set<Orderdetail> orderdetailSet) {
        this.orderdetailSet = orderdetailSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Food)) {
            return false;
        }
        Food other = (Food) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dvh.pojo.Food[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
}
