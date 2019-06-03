package com.scce.dao;

import com.scce.pojo.Emplyee;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @program: IdeaProjects
 * @description:
 * @author: Lxy
 * @create: 2019-05-30 21:38
 **/
public interface EmplyeeDao {
    //根据账号查询员工信息
    @Select("select * from emplyee where account=#{account}")
    public Emplyee findEmplyeeAccount(String account) throws  Exception;

    //查询所有员工信息
    @Select("select * from emplyee")
    public   List<Emplyee> getEmplyee();

    //根据id删除
    @Delete("delete from emplyee where id=#{id}")
   public  void delEmplyee(int id) throws  Exception;
}
