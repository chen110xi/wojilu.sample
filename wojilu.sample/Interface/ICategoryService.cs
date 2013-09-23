using System;
using System.Collections.Generic;
using wojilu.sample.Domain;

namespace wojilu.sample.Interface {

    public interface ICategoryService {

        List<Category> GetAll();
        Category GetById( int id );

        Result Insert( Category c );
        Result Update( Category c );

    }

}
