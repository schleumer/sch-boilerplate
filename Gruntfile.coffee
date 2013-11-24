module.exports = (grunt) ->
	grunt.initConfig
		clean: [
			'public/less/',
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
					'public/less/**/*.less'
				]
				tasks: [
					'less'
				]
		less:
			options:
				paths: [
					'public/less/'
				]
				compress: true
				yuicompress: true
				optimization: 2
				files: [
					'public/less/main.less'
				]
		coffee:
			glob_to_multiple:
				expand: true
				flatten: true
				cwd: 'public/coffee'
				src: [
					'*.coffee'
				]
				dest: 'public/js/'
				ext: '.js'
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
	grunt.loadNpmTasks 'grunt-nodemon'
	grunt.loadNpmTasks 'grunt-concurrent'
	grunt.registerTask 'default', ['concurrent']
	grunt.registerTask 'dev', ['clean', 'less:compile', 'watch:styles']
