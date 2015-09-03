as yet unclassified
downloadFiles

	| targetFolder |
	targetFolder := '/Developer/cogvm/' asFile.
	ZnClient download: 'http://ci.lille.inria.fr/pharo/job/Cog%20Git%20Tracker/lastSuccessfulBuild/artifact/cog.tar.gz' to: targetFolder.
	ZnClient download: 'http://ci.lille.inria.fr/pharo/job/Cog%20Git%20Tracker/lastSuccessfulBuild/artifact/vmmaker-image.zip' to: targetFolder.