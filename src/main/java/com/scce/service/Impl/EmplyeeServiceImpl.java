package com.scce.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.scce.dao.EmplyeeDao;
import com.scce.pojo.Emplyee;
import com.scce.service.EmplyeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: IdeaProjects
 * @description:
 * @author: Lxy
 * @create: 2019-06-01 10:20
 **/
@Service("userService")
@Transactional
public class EmplyeeServiceImpl implements EmplyeeService {
    @Autowired
    private EmplyeeDao emplyeeDao;



    //查询员工信息并分页
    @Override
    public PageInfo<Emplyee> getEmplyee(int pageNum, int pageSize) throws Exception{
        PageHelper.startPage(pageNum, pageSize);
        //紧跟在PageHelper.startPage(pageNum, pageSize);的查询语句会执行分页，mysql中就会为它拼上limit
        List<Emplyee> list=emplyeeDao.getEmplyee();
        PageInfo<Emplyee> pageInfo = new PageInfo<Emplyee>(list);
        return pageInfo;

    }

    @Override
    public void delEmplyee(int id) throws Exception {
        emplyeeDao.delEmplyee(id);
    }

    @Override
    public Emplyee login(Emplyee emplyee) {
        emplyeeDao.login(emplyee);
        return null;
    }


}
