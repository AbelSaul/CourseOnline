<template>
<div id="">
		<div id="listado" class="animated bounceInLeft">
		<h2 v-text="name">Expert PHP</h2>	
			<ul>
				<li class="animated bounceInLeft"
					v-for="content_course in contents_course"
					@click="playVideo(content_course)"
					:class="{activo:content_course.activo}"
					>	
					<div class="titulo" :title="content_course.title">{{ content_course.title }}</div>					
				</li>
			</ul>
		</div>
		<iframe id="rpd" allow="autoplay" :src="active" ></iframe>				
	</div>

</template>

<script >

export default{
  data(){
  	return {
  		content_course: {
    		title: '',  
    		url_video: ''			
  		},
    	active: '',
    	contents_course : [],
    	name: ''
	}
  },
  mounted(){
  	 this.readContentsCourse();
  },
  methods: {
  	readContentsCourse()
    {
    	const urlActual = window.location;
		var cadena = String(urlActual),separador = "/", arregloDeSubCadenas = cadena.split(separador);

		var n = arregloDeSubCadenas.length;
        console.log(n);

        axios.get('/contents-course/'+arregloDeSubCadenas[n-1])
             .then(response => {
                 this.contents_course = response.data.contents_course;
                 this.name = response.data.name_course;
                 console.log(response);
        });
 	},
    playVideo: function(content_course) {
      var laUrl = content_course.url_video;
      var nuevaUrl = laUrl.replace("watch?v=", "embed/");
      var i = 0;
      this.active = nuevaUrl + '?&autoplay=1';
      for(i=0;i<this.contents_course.length;i++){
     	 this.contents_course[i].activo=false;
      }
      content_course.activo = true;
    }
  },
  created() {
    const resize = document.createElement('script')
    resize.setAttribute('src', 'js/dimensiones.js')
    document.head.appendChild(resize)
  },
}

</script>

<style scoped>
	
@import "https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css";
@import "https://fonts.googleapis.com/css?family=Raleway";

body { 
	margin: 0px; 
	background-color: #eee;
	color: #888;
}
#menu { 
	width: 300px; 	
	height: 37px;
	float: left;
	padding: 6px 0px;  
}
#buscador { 
	width: 40%; 
	float: left;
	padding: 6px; 
	font-size: 20px; 
	outline: none; 
	text-align: center; 
	float: left;
}
#listado { 
	width: 300px; 
	padding: 6px; 
	float: left; 
	overflow-y: scroll; 
	font-family: 'Raleway', sans-serif;
	color: #999;

}
#rpd	{
	margin: 10px;
	background-color: #d9d9d9; 
	border-radius: 3px; 
	border: 3px solid #aaa; 
	box-shadow: 0px 5px 5px #888;	
	border: none;

}
input { 
	width: 50%; 
	padding: 6px; 
	border-radius: 5px; 
	font-size: 20px; 
	border: 1px solid #ccc; 
	outline: none; 
	text-align: center; 
	background-color: #fff; 

}
li{ 
	width: 98%; 
	height: auto; 
	padding: 5px; 
	margin-top: 3px; 
	list-style: none; 
	outline: none; 
	margin-left: -25px; 
	float: left; 
	cursor: pointer; 
	border-radius: 5px;
	border: 1px solid #eee;
	border-bottom: 1px solid #ccc;
	
}
li:hover { 
	background-color: #fff; 
	color: #444; 
	border: 1px solid #ccc; 
}
.titulo	{ 
	font-size: 15px; 	
	width: auto;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-transform: capitalize;	
}

.titulo:before {
	content: url('/img/ico_play2.png'); 
	position: relative;
	top: 2px;
	margin-right: 10px; 
}
.activo { 
	background-color: #fff; 
	color: #444;
	font-weight: 600; 
	border: 1px solid #ccc;
	box-shadow: 2px 2px 3px #777;
}
.ico	{
	width: 30px;
	height: 30px;
	margin-left: 20px;
	float: left;
}
.ico:hover {
	transform: scale(1.1);
	cursor: pointer;
}
#ico-add	{
	background-image: url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678092-sign-add-512.png');
	background-size: 30px 30px;
}
#ico-sort	{
	/* img/ico-sort.png */
	background-image: url('https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678092-sign-add-512.png');
	background-size: 30px 30px;
}
h2{
	text-align: center;
}

</style>