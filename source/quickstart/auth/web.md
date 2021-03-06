
title: 快速入门
---

你可以通过邮箱登录的例子来了解身份认证的基本用法。

<div class="env">
    <p class="env-title">环境准备</p>
    <ul>
        <li>支持 Chrome、IE、Firefox、Safari 等主流浏览器环境 </li>
    </ul>
</div>

## 1. 创建应用

首先，你需要在控制面板中创建应用。请参考 [控制面板-创建应用](/console/creat.html)。

## 2. 安装 SDK

Web SDK 有直接引用和 `npm` 安装两种方式可供选择。直接引用时任选以下两种方式之一

- **安装完整 Wilddog SDK(推荐，包含 Sync 和 Auth)**

<figure class="highlight html"><table><tbody><tr><td class="code"><pre><div class="line"><span class="tag"><<span class="name">script</span> <span class="attr">src</span> = <span class="string">"<span>ht</span>tps://cdn.wilddog.com/sdk/js/<span class="js-version"></span>/wilddog.js"</span>></span><span class="undefined"></span><span class="tag"></<span class="name">script</span>></span></div></pre></td></tr></tbody></table></figure>

- **独立安装 Sync  SDK**

<figure class="highlight html"><table><tbody><tr><td class="code"><pre><div class="line"><span class="tag"><<span class="name">script</span> <span class="attr">src</span> = <span class="string">"<span>ht</span>tps://cdn.wilddog.com/sdk/js/<span class="js-version"></span>/wilddog-auth.js"</span>></span><span class="undefined"></span><span class="tag"></<span class="name">script</span>></span></div></pre></td></tr></tbody></table></figure>

如果是 `NodeJS` 或者 `ReactNative` 项目，请使用 `npm` 安装

```
npm install wilddog --save
```

## 3. 初始化 Wilddog Auth 实例

使用 Auth SDK 之前，需要先初始化实例

```javascript
var config = {
  authDomain: "<appId>.wilddog.com",
  syncURL: "https://YOUR_APPID.wilddogio.com" 
};
wilddog.initializeApp(config);
```

如果你的应用中并未用到 `Sync` 模块，代码中所示的 `syncURL` 项可以忽略。

## 4. 使用邮箱认证

**1.开启邮箱登录**

在 控制面板—身份认证—登录方式 中开启邮箱登录功能

![](/images/openemail.png)

**2.监听用户登录状态**

```js
wilddog.auth().onAuthStateChanged(function (userInfo) {
    if(userInfo) {
	    console.info('user login',user, wilddog.auth().currrentUser);
    }else {
	    console.info('user logout');
    }
});
```
**3.创建新用户**

```js
wilddog.auth().createUserWithEmailAndPassword(email,pwd)
	.then(function (user) {
    console.info("user created.", user);
	}).catch(function (err) {
    console.info("create user failed.", err);
});
```

**4.邮箱密码登录**

已经存在的用户可以使用 `signInWithEmailAndPassword()` 方法登录。

```js
wilddog.auth().signInWithEmailAndPassword(email, pwd)
    .then(function () {
        console.info("login success, currentUser->",  wilddog.auth().currentUser);
    }).catch(function (err) {
        console.info('login failed ->',err);
    });
```

## 5. 退出登录

你可以使用 `signOut()` 方法退出当前登录用户

```js
wilddog.auth().signOut().then(function () {
    console.info("user sign out.");
});
```



野狗还提供了匿名认证、第三方认证等其他认证方式，详细信息请见 [完整指南](/guide/auth/core/concept.html) 和  [API 文档](/api/auth/web.html)。