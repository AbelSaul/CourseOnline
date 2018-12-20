<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <input type="search" v-model="search" placeholder="Course name">
                    </div>
                    <div id="app-course" class="animated bounceInLeft">
                        <div v-for="course in searchByName" class="caratula">
                          <img :src="course.url_img">
                          <p>Course: {{ course.name }}</p>
                          <p>Author: {{ course.author }}</p>   
                          <p>Duration: {{course.duration}}</p>       
<!--                           <button  class="btn btn-success btn-xs">watch now
                          </button>  
 -->
                          <router-link class="btn btn-success btn-xs" tag="button" :to="'/contents-course/' + course.id">Watch now</router-link>

                         </div>           

                    </div>
              </div>
           </div>
        </div> 
    </div>             
</template>

<script>

export default{
  data() {
      return {
          course:{
            name: '',
            author: '',
            url_image: '',
            description: ''
          },
          errors: [],
          usercourses: [], 
          search:'' ,
        }
    },
    mounted() {
      this.readCourses();
    },

    methods: {
        readCourses()
            {
                axios.get('/user-courses')
                    .then(response => {
                        this.usercourses = response.data.user_courses;
                    });
            },
          addCourse(course_id)
            {
    
                axios.post('/user-courses', {
                    course_id: course_id ,
                })
                    .then(response => {
                        // this.tasks.push(response.data.task);
                    })
                    .catch(error => {
                        this.errors = [];
    
                    });
          },
    },
    computed: {
        searchByName() { 
        // Hacemos referencia a nuestro list y vamos a filtrar con el metodo filter de js
        //le pasamos un parametro al que llamamos search y luego accedemos a su clave titulo y le vamos a decir que solo escoga a los que incluya la coincidencia con la search
        //Por lo tanto cuando search tiene cualquier conincidencia de texto lo que hara es filtrarnos ese nuevo array y mostrarnos en pantalla, para que funcione esta propiedad computada se la vamos a pasar al v-for
        return this.usercourses.filter((search) => search.name.includes(this.search))
    }
  }
}
</script>

<style>

  @import "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css";
  @import "https://fonts.googleapis.com/css?family=Raleway";

  body {
    background-color: #eee;
  }
  [type="search"]{
    width: 99%;
    height: 40px;
    text-align: center;
    color: #888;
    font-size: 24px;
    border-radius: 15px;
  }
  ul { 
    list-style: none; 
  }
  .caratula { 
    width: 287px; 
    height: 287px; 
    float: left;
    /*Agujas del reloj*/
    padding: 6px 2px 8px 2px; 
    font-size: 20px; 
    margin: 15px; 
    font-family: 'Raleway', sans-serif; 
    color: #888; 
    outline: none;
    text-align: center;
    /*horizontal vertical  El radio de desenfoque. Cuanto mayor sea el número, más borrosa será la sombra*/
    box-shadow: 1px 1px 3px #333;
    border-radius: 15px;
    background-color: #fefefe;
    animation: entrada 0.5s;
  }
  img { 
    width: 210px; 
    height: auto; 
    background-color: #ccc; 
    padding: 5px 5px 10px 5px; 
    border-radius: 10px; 
    border: 1px solid #eee; 
  }
  @keyframes entrada {
    0% {
      transform: scale(0);
      background-color: #000;
      opacity: 0;
    }
    50% {
      transform: scale(1.5);
    }
    100% {
      transform: scale(1);
      background-color: #fff;
      opacity: 1;
    }
  }

  p{
    margin-bottom: 0;
  }
  #ico-add  {
  background-image: url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678092-sign-add-512.png');
  background-size: 30px 30px;
  }
</style>
