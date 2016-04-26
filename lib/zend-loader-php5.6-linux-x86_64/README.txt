Zend Guard Loader installation instructions
-------------------------------------------

Installing Zend Guard Loader for any PHP-NTS distribution:
==========================================================
1. Extract the Zend Loader package that corresponds to your php version and OS arch (the package also contains opcache binary) 

2. Place the ZendLoader and opcache binaries in your filesystem.

3. Add the following lines to your php.ini file for loading the ZendGuardLoader:
   Linux and Mac OS X:      
   	zend_extension=<full_path_to_ZendGuardLoader.so>
   	zend_extension=<full_path_to_opcache.so>
   
   Windows non-thread safe: 
   	zend_extension=<full_path_to_ZendLoader.dll>
   	zend_extension=<full_path_to_opcache.dll>
   
   * Note: The supplied opcache replaces your current opcache binary in order to allow correct extension loading.
   * Note: Loader line should be first
   
4. Optional: Add an aditional line to your php.ini for enabling ZendGuardLoader
  ; Enables loading encoded scripts. The default value is On
  zend_loader.enable=1
     
5. Optional: following lines can be added your php.ini file for ZendGuardLoader configuration:

   ; Disable license checks (for performance reasons)
     zend_loader.disable_licensing=0
   ; The Obfuscation level supported by Zend Guard Loader. The levels are detailed in the official Zend Guard Documentation. 0 - no obfuscation is enabled
     zend_loader.obfuscation_level_support=3
   ; Path to where licensed Zend products should look for the product license. For more information on how to create a license file, see the Zend Guard User Guide
     zend_loader.license_path= 

6. Restart your Web server.

7. Check that loader and opcache are both loaded ( phpinfo() ) or php -v

8. Run your encoded files


Installing Zend Guard Loader on top of Zend Server 8.0.2:
=========================================================
Linux/Mac
---------
1.Extract the Zend Loader package that corresponds to your php version and OS arch. 
2.Locate folder /usr/local/zend/lib/php_extensions and overwrite opcache.so while adding in ZendGuardLoader.so
3.Open your /usr/local/zend/etc/conf.d/opcache.ini file.
	Before the directive zend_extension=/usr/local/zend/lib/php_extensions/opcache.so add the following line (at the very beginning of the file):
        zend_extension=/usr/local/zend/lib/php_extensions/ZendGuardLoader.so
      
4.Restart Zend Server.
5.If all is well as it should be the Zend Guard Loader section will be present on Overview -> Server Info page

Windows
-------
Main steps:
1.Extract the Zend Loader package that corresponds to your php version and OS arch. 
2.Locate folder C:\Program Files (x86)\Zend\ZendServer\lib\phpext and overwrite php_opcache.dll while adding in ZendLoader.dll.
3.Open your php ini file.
        Locate the opcache section starting with the directive zend_extension="C:\Program Files (x86)\Zend\ZendServer\lib\phpext\php_opcache.dll"
        Add the following line into your php.ini file just before the located opcache directive (at the very beginning of opcache section):
        zend_extension="C:\Program Files (x86)\Zend\ZendServer\lib\phpext\ZendLoader.dll"
4.Restart Zend Server.
5.If all is well as it should be the Zend Guard Loader section will be present on Overview -> Server Info page
