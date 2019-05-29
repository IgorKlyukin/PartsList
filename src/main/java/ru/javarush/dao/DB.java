package ru.javarush.dao;

import ru.javarush.model.PartEntity;

import java.util.ArrayList;

public interface DB {
    ArrayList<PartEntity> getList();
    ArrayList<PartEntity> searchPartOnName(String name);
    PartEntity searchPartOnId(int id);
    ArrayList<PartEntity> sortList(Details details);
    void insertUpdateParts(PartEntity parts);
    void deleteParts(int id);
    int minOptionTrue();
}
