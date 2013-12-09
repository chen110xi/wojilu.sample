using System;
using System.Collections.Generic;
using System.Text;
using wojilu.Web;
using wojilu.Web.Mvc;
using wojilu.sample.Domain;

namespace wojilu.sample.Controller {

    public class LayoutController : ControllerBase {

        public override void Layout() {

            set( "adminLink", to( new Admin.ArticleController().Index ) ); // 后台管理首页的链接
            set( "loginLink", to( new Admin.LoginController().Login ) );


            List<Category> categories = Category.findAll();
            bind( "categories", categories );

            List<Footer> footers = cdb.findAll<Footer>();
            bind("footers", footers);

            bindNavCurrent();
        }

        private void bindNavCurrent() {
            string s = "";
            string path = ctx.url.Path;
            if (path == "" || path == "/" || path.ToLower() == "/default.aspx") s = "class=\"selected\"";
            set( "homeSelected", s );
        }

    }

}
