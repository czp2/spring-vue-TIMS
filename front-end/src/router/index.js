import Vue from "vue"
import VueRouter from "vue-router"

import Main from '../views/Main'
import Login from "../views/Login";

import UserList from "../views/user/UList";
import ViewList from "../views/view/VList";
import CList from "../views/comment/CList";
import SList from "../views/statistics/SList";
import NotFound from "../views/NotFound";
import CreateView from "../views/view/CreateView";

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: Login
    }, {
      path: '/main',
      component: Main,
      children: [
        {path: '/user/list', component: UserList},
        {path: '/view/list', component: ViewList},
        {path: '/view/create', component: CreateView},
        {path: '/comment/list', component: CList},
        {path: '/statistics/list', component: SList},
      ]
    }, {
      path: '*',
      component: NotFound
    }
  ]
});
