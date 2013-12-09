using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using wojilu.Web;
using wojilu.Web.Mvc;
using wojilu.sample.Domain;

namespace wojilu.sample.Controller {

    public class FooterController : ControllerBase {

        public void Show( long id ) {
            bindFooterList( id );
            Footer f = cdb.findById<Footer>( id );
            set( "footer.Content", HttpUtility.HtmlDecode( f.Content ) );
            set( "footer.Name", f.Name );
        }

        private void bindFooterList( long id ) {
            List<Footer> list = cdb.findAll<Footer>();
            IBlock block = getBlock( "list" );
            foreach (Footer a in list) {
                block.Set( "a.Title", strUtil.CutString( a.Name, 15 ) );
                block.Set( "a.ShowLink", to( new FooterController().Show, a.Id ) );
                block.Set( "a.Selected", a.Id == id ? "class='fselected'" : "" );
                block.Next();
            }
        }

    }

}
