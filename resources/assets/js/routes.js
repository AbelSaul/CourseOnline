import VueRouter from 'vue-router';
import Task from './components/Task.vue';
import Profile from './components/Profile.vue';
import Course from './components/Course.vue';
import UsersCourse from './components/UsersCourse.vue';
import ContentsCourse from './components/ContentsCourse.vue';




let routes = [
    {
        path: '/task',
        component: Task
    },
    {
        path: '/profile',
        component: Profile
    },
    {
        path: '/course',
        component: Course
    },
    {
        path: '/user-courses',
        component: UsersCourse
    },
    {
        path: '/contents-course',
        component: ContentsCourse
    },
    {
        path: '/contents-course/:course_id',
        component: ContentsCourse
    }
];


export default new VueRouter({
    routes
});