package com.scce.service;

import com.github.pagehelper.PageInfo;
import com.scce.pojo.Emplyee;

/**
 * @program: IdeaProjects
 * @description:
 * @author: Lxy
 * @create: 2019-06-01 10:18
 **/
public interface EmplyeeService  {
    //查询员工信息并分页
   public PageInfo<Emplyee> getEmplyee(int pageNum, int pageSize) throws Exception;

   //根据id删除员工
    public void delEmplyee(int id) throws Exception;

    public  Emplyee login(Emplyee emplyee);
}
