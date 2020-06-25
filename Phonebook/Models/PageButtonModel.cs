namespace Phonebook.Models
{
    public class PageButtonModel
    {
        // Na razie używana jest tylko pierwsza właściwość
        // Pozostałe są 'rozwojowe'
        public int PageNumber { get; set; }
        public bool Previous { get; set; }
        public bool Next { get; set; }
    }
}
