package com.galaxy.web.Listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.galaxy.entity.Account;
import com.galaxy.service.AccountService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;

@Component
@Scope("prototype")//作者要求每次读取都要或使用新的Listener----多例模式
public class AccountExcelListener extends AnalysisEventListener<Account> {

    private final Integer MAX_SIZE = 5;
    ArrayList<Account> accountList = new ArrayList<>();
    @Resource
    private AccountService accountService;
    private Integer count = 0;


    //调用
    @Override
    public void invoke(Account account, AnalysisContext analysisContext) {
        //accountService.insert(account);
        accountList.add(account);
        if (++count % MAX_SIZE == 0){
            accountService.insertBatch(accountList);
            accountList.clear();
        } else {
            if (accountList.size() > 0) {
                accountService.insertBatch(accountList);
                accountList.clear();
            }
        }


    }

    //读取之后需要做的操作
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
