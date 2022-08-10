package com.example.trainingbase.interceptor;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.EmptyInterceptor;
import org.hibernate.type.StringType;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.lang.reflect.Field;

@Component
@Slf4j
@Getter
@Setter
public class TestInterceptor extends EmptyInterceptor {


    public static boolean testEnable;

    @Override
    public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {
        log.info("Convert empty String: " + testEnable);
        if(testEnable) {
            for(int i = 0; i< types.length; i++) {
                if(types[i] instanceof StringType && ("").equals(state[i])) {
                    Class<?> classType = entity.getClass();
                    try {
                        Field f = classType.getDeclaredField(propertyNames[i]);
                        f.setAccessible(true);
                        f.set(entity, null);
                        state[i] = null;
                    } catch (Exception e) {
                        log.error("fail to convert empty string to null");
                    }
                }
            }
        }

        return super.onSave(entity, id, state, propertyNames, types);
    }

    @Value("${test.enable}")
    public void setTestEnable(boolean testEnable){
        this.testEnable = testEnable;
    }
}
