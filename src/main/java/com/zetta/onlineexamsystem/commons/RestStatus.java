package com.zetta.onlineexamsystem.commons;

public interface RestStatus<K,T> {
    /**
     * the status codes of per restful request.
     *
     * @return 20xxx if succeed, 40xxx if client error, 50xxx if server side crash.
     */
    K code();

    /**
     * @return status enum name
     */
    String name();

    /**
     * @return 消息描述
     */
    T message();
}

