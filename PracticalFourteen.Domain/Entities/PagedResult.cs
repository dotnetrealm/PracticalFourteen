using System.Collections.Generic;

namespace PracticalFourteen.Domain.Entities
{
    public class PagedResult<T>
    {
        //Private set only allows to set value of props from constructor only, while creating object of PageResultClass
        public List<T> Items { get; private set; }
        public int TotalCount { get; private set; }
        public int PageNumber { get; private set; }
        public int PageSize { get; private set; }

        public PagedResult(List<T> items, int totalCount, int pageNumber, int pageSize)
        {
            Items = items;
            TotalCount = totalCount;
            PageNumber = pageNumber;
            PageSize = pageSize;
        }
    }
}
