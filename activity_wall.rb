Trample.configure do
  concurrency 1
  iterations  1

  #Activity wall, 2k req/sec
  get "http://partners.socialvibe.com/s/partners/config/:id/activity_wall_iframe/:user?app_activity_count=:app_activity_count&app_activity_data=:app_activity_data&cal=Cash&config_module_args=&config_module_url=com%2Fsocialvibe%2Fmodules%2Fconfigs%2FPetVilleConfig.swf&cr=10&height=485&rs=Petville&width=750" do
    {:id => "d78d33bf67f0b1e5366fb9e63acbd085e3d8cbda", :user => "624091761", :app_activity_count => "3", :app_activity_data => "eJy9lG1v2jAQx7%2FKKW94g1hhdIVK01ZUitAEqpi0Sl2myCRH4uHYaXxJyqZ999lOOh60VmhjexEnZ5%2Fv7u%2F7OZ%2B9776XqqgQGJQs17536Xslj1AFRS7eJkTZpe%2F7r%2ByTYsRZR6uQM1HyJXZClbp5O7CQeMmJo7ZWhrlUkf0aTeeT8fViOv9gPjorUb7Pciw5ViePH9wuxp%2Bm47vO1yz2vbbvcakpL8w%2BJQPCR3LaQsHDNSgJLZ1xCZQgVAmiaAGTkTUl1C6tSElsdVwkU0gmkDAyIVZMaLTRQxOWp7HV4SIfpYVlWbAvpdsdulev%2F2ie4NYp%2B6WhaU3FI0pMlovzgU1t6zD7tusJ8jixAnsXdrbJsAkirjPBNlv5V2GIGcECdaak5ksujBvspnqS0xS8leBkOR9XN8qYxZiiJGeGhaZ6R61g5jw7ulr53g%2BvfSrMUpavkbiMrRHniPKbadOeEbi4f4Ha8znqipuoL3PGpK4wd3y9gUwJAQ8FauujD0nz%2FaJ31g1vuOQ6qY3o32M3GNjX5D64GfUCQ55%2BOAa6weB30A3PX4RuYs8Q7s0hgiaW5%2BZoYcaI4JqlSrahvoeMMNfwur4Mbjw7KZeuClvEEWg%2B39eKUZgAA4dCG3ba%2FNTfdtNWO9e09lZpgivn2vQXlgWR9T1gYWfT3Kbc8%2F4PP6Nhf%2Fdn9FHJzTFUDPt%2FQMVdwgiiHFmqIVKwUQVUTBKQgpStEcyKeHdSAqycmQk9QsGxPODgy0%2FSh4GT" }
  end
end