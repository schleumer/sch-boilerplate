module.exports = (grunt) ->
	grunt.initConfig
		clean: [
			'public/css/',
			'public/js/'
		]
		concurrent:
			dev:
				tasks: [
					'watch',
					'nodemon'
				]
				options:
					logConcurrentOutput: true
		watch:
			styles:
				files: [
					'public/less/**/*.less',
					'public/coffee/**/*.coffee'
				]
				tasks: [
					'less', 'coffee', 'uglify'
				]
		less:
			development:
				options:
					paths: [
						'public/less/'
					]
					compress: true
					yuicompress: true
					optimization: 2
				files:
					'public/css/main.css': 'public/less/main.less'
		coffee:
			glob_to_multiple:
				expand: true
				flatten: true
				compress: true
				cwd: 'public/coffee'
				src: [
					'*.coffee'
				]
				dest: 'public/js/'
				ext: '.js'
		uglify:
			my_target:
				files: [
					expand: true
					cwd: "public/js"
					src: "**/*.js"
					dest: "public/js"
					ext: ".min.js"
				]
		nodemon:
			dev:
				options:
					file: 'server.coffee'
#					nodeArgs: [
#						'--debug'
#					]
					env:
						PORT: '3000'

	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-nodemon'
	grunt.loadNpmTasks 'grunt-concurrent'
	grunt.registerTask 'default', ['concurrent']
	grunt.registerTask 'dev', ['clean', 'less:compile', 'watch:styles']
