package ru.javarush.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import ru.javarush.HibernateSessionFactoryUtil;
import ru.javarush.model.PartEntity;

import java.util.ArrayList;

public class DBmysql implements DB {
    private SessionFactory sessionFactory;
    private static DBmysql dBmysql = new DBmysql();

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private DBmysql(){}

    public static DBmysql getdBmysql() {
        dBmysql.setSessionFactory(HibernateSessionFactoryUtil.getSessionFactory());
        return dBmysql;
    }

    @Override
    public ArrayList<PartEntity> getList() {
        return new ArrayList<PartEntity>(sessionFactory.openSession().createQuery("From PartEntity").list());
    }

    @Override
    public ArrayList<PartEntity> searchPartOnName(String name) {
        return new ArrayList<PartEntity>(sessionFactory.openSession().createQuery("From PartEntity where name like '%" + name + "%'" ).list());
    }

    @Override
    public PartEntity searchPartOnId(int id) {
        return sessionFactory.openSession().get(PartEntity.class, id);
    }

    @Override
    public ArrayList<PartEntity> sortList(Details details) {
        String s = "";
        switch (details){
            case OPTIONTRUE:{
                s = "where need = true";
                break;
            }
            case OPTIONFALSE:{
                s = "where need = false";
                break;
            }
            case ALL:
            default: break;
        }
        return new ArrayList<PartEntity>(sessionFactory.openSession().createQuery("From PartEntity " + s + " order by name").list());
    }

    @Override
    public void insertUpdateParts(PartEntity parts) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        session.saveOrUpdate(parts);
        tx.commit();
        session.close();
    }

    @Override
    public void deleteParts(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
        PartEntity parts = session.load(PartEntity.class, id);
        if (parts != null)
            session.delete(parts);
        tx.commit();
        session.close();
    }

    @Override
    public int minOptionTrue() {
        return (Integer) sessionFactory.openSession().createQuery("select MIN(p.count) From PartEntity p where need = true group by p.count").list().get(0);
    }
}
