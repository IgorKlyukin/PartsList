package ru.javarush.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "part", schema = "test")
public class PartEntity {
    private int id;
    private String name;
    private boolean need;
    private int count;

    public PartEntity() {
    }

    public PartEntity(int id, String name, boolean need, int count) {
        this.id = id;
        this.name = name;
        this.need = need;
        this.count = count;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = false, length = 64)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "need", nullable = false)
    public boolean isNeed() {
        return need;
    }

    public void setNeed(boolean need) {
        this.need = need;
    }

    @Basic
    @Column(name = "count", nullable = false)
    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PartEntity that = (PartEntity) o;
        return id == that.id &&
                need == that.need &&
                count == that.count &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, need, count);
    }

    @Override
    public String toString() {
        return "PartEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", need=" + need +
                ", count=" + count +
                '}';
    }
}
