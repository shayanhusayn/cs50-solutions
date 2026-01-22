const books = [
  {
    title: "Code Complete",
    description: "A Practical Handbook of Software Construction.",
    image: "https://covers.openlibrary.org/b/isbn/9780735619678-L.jpg",
    link: "https://openlibrary.org/isbn/9780735619678"
  },
  {
    title: "Introduction to Algorithms",
    description: "Comprehensive guide to modern algorithms.",
    image: "https://covers.openlibrary.org/b/isbn/9780262033848-L.jpg",
    link: "https://openlibrary.org/isbn/9780262033848"
  },
  {
    title: "The C Programming Language",
    description: "The classic book on C programming.",
    image: "https://covers.openlibrary.org/b/isbn/9780131103627-L.jpg",
    link: "https://openlibrary.org/isbn/9780131103627"
  },
  {
    title: "Design Patterns",
    description: "Reusable Object-Oriented Software patterns.",
    image: "https://covers.openlibrary.org/b/isbn/9780201633610-L.jpg",
    link: "https://openlibrary.org/isbn/9780201633610"
  },
  {
    title: "Refactoring",
    description: "Improving the design of existing code.",
    image: "https://covers.openlibrary.org/b/isbn/9780201485677-L.jpg",
    link: "https://openlibrary.org/isbn/9780201485677"
  },
  {
    title: "Eloquent JavaScript",
    description: "A modern introduction to programming.",
    image: "https://covers.openlibrary.org/b/isbn/9781593279509-L.jpg",
    link: "https://eloquentjavascript.net/"
  },
  {
    title: "JavaScript: The Good Parts",
    description: "Unearthing the excellence in JavaScript.",
    image: "https://covers.openlibrary.org/b/isbn/9780596517748-L.jpg",
    link: "https://openlibrary.org/isbn/9780596517748"
  },
  {
    title: "Effective Java",
    description: "Best practices for Java programming.",
    image: "https://covers.openlibrary.org/b/isbn/9780134685991-L.jpg",
    link: "https://openlibrary.org/isbn/9780134685991"
  },
  {
    title: "Head First Design Patterns",
    description: "A brain-friendly guide to design patterns.",
    image: "https://covers.openlibrary.org/b/isbn/9780596007126-L.jpg",
    link: "https://openlibrary.org/isbn/9780596007126"
  },
  {
    title: "Cracking the Coding Interview",
    description: "189 programming interview questions.",
    image: "https://covers.openlibrary.org/b/isbn/9780984782857-L.jpg",
    link: "https://openlibrary.org/isbn/9780984782857"
  },
  {
    title: "Programming Pearls",
    description: "Classic programming problem solving.",
    image: "https://covers.openlibrary.org/b/isbn/9780201657883-L.jpg",
    link: "https://openlibrary.org/isbn/9780201657883"
  },
  {
    title: "The Mythical Man-Month",
    description: "Essays on software engineering.",
    image: "https://covers.openlibrary.org/b/isbn/9780201835953-L.jpg",
    link: "https://openlibrary.org/isbn/9780201835953"
  },
  {
    title: "Structure and Interpretation of Computer Programs",
    description: "Foundational computer science concepts.",
    image: "https://covers.openlibrary.org/b/isbn/9780262510875-L.jpg",
    link: "https://mitpress.mit.edu/sites/default/files/sicp/index.html"
  },
  {
    title: "Operating System Concepts",
    description: "The dinosaur book on OS.",
    image: "https://covers.openlibrary.org/b/isbn/9781118063330-L.jpg",
    link: "https://openlibrary.org/isbn/9781118063330"
  },
  {
    title: "Computer Networks",
    description: "Top-down networking approach.",
    image: "https://covers.openlibrary.org/b/isbn/9780133594140-L.jpg",
    link: "https://openlibrary.org/isbn/9780133594140"
  },
  {
    title: "Modern Operating Systems",
    description: "In-depth OS concepts.",
    image: "https://covers.openlibrary.org/b/isbn/9780133591620-L.jpg",
    link: "https://openlibrary.org/isbn/9780133591620"
  },
  {
    title: "Database System Concepts",
    description: "Fundamentals of databases.",
    image: "https://covers.openlibrary.org/b/isbn/9780073523323-L.jpg",
    link: "https://openlibrary.org/isbn/9780073523323"
  },
  {
    title: "Clean Architecture",
    description: "A craftsman’s guide to software structure.",
    image: "https://covers.openlibrary.org/b/isbn/9780134494166-L.jpg",
    link: "https://openlibrary.org/isbn/9780134494166"
  },
  {
    title: "Domain-Driven Design",
    description: "Tackling complexity in software.",
    image: "https://covers.openlibrary.org/b/isbn/9780321125217-L.jpg",
    link: "https://openlibrary.org/isbn/9780321125217"
  },
  {
    title: "The Art of Computer Programming",
    description: "Classic algorithms and theory.",
    image: "https://covers.openlibrary.org/b/isbn/9780201896831-L.jpg",
    link: "https://openlibrary.org/isbn/9780201896831"
  },
  {
    title: "Compilers: Principles, Techniques, and Tools",
    description: "The Dragon Book.",
    image: "https://covers.openlibrary.org/b/isbn/9780321486813-L.jpg",
    link: "https://openlibrary.org/isbn/9780321486813"
  },
  {
    title: "Patterns of Enterprise Application Architecture",
    description: "Enterprise software patterns.",
    image: "https://covers.openlibrary.org/b/isbn/9780321127426-L.jpg",
    link: "https://openlibrary.org/isbn/9780321127426"
  },
  {
    title: "Soft Skills",
    description: "The software developer’s life manual.",
    image: "https://covers.openlibrary.org/b/isbn/9781617292392-L.jpg",
    link: "https://openlibrary.org/isbn/9781617292392"
  },
  {
    title: "The Clean Coder",
    description: "A code of conduct for professionals.",
    image: "https://covers.openlibrary.org/b/isbn/9780137081073-L.jpg",
    link: "https://openlibrary.org/isbn/9780137081073"
  },
  {
    title: "Algorithms",
    description: "Algorithms explained visually.",
    image: "https://covers.openlibrary.org/b/isbn/9780321573513-L.jpg",
    link: "https://openlibrary.org/isbn/9780321573513"
  },
  {
    title: "Grokking Algorithms",
    description: "An illustrated guide to algorithms.",
    image: "https://covers.openlibrary.org/b/isbn/9781617292231-L.jpg",
    link: "https://openlibrary.org/isbn/9781617292231"
  },
  {
    title: "Python Crash Course",
    description: "A fast-paced Python introduction.",
    image: "https://covers.openlibrary.org/b/isbn/9781593279288-L.jpg",
    link: "https://openlibrary.org/isbn/9781593279288"
  },
  {
    title: "Fluent Python",
    description: "Clear, concise Python programming.",
    image: "https://covers.openlibrary.org/b/isbn/9781491946008-L.jpg",
    link: "https://openlibrary.org/isbn/9781491946008"
  },
  {
    title: "Learning React",
    description: "Functional web development with React.",
    image: "https://covers.openlibrary.org/b/isbn/9781491954621-L.jpg",
    link: "https://openlibrary.org/isbn/9781491954621"
  },
  {
    title: "CSS: The Definitive Guide",
    description: "Complete guide to CSS.",
    image: "https://covers.openlibrary.org/b/isbn/9781449393199-L.jpg",
    link: "https://openlibrary.org/isbn/9781449393199"
  },
  {
    title: "HTML and CSS: Design and Build Websites",
    description: "Visual web development guide.",
    image: "https://covers.openlibrary.org/b/isbn/9781118008188-L.jpg",
    link: "https://openlibrary.org/isbn/9781118008188"
  },
  {
    title: "Web Performance in Action",
    description: "Building faster web applications.",
    image: "https://covers.openlibrary.org/b/isbn/9781617293771-L.jpg",
    link: "https://openlibrary.org/isbn/9781617293771"
  },
  {
    title: "The Linux Programming Interface",
    description: "System programming on Linux.",
    image: "https://covers.openlibrary.org/b/isbn/9781593272203-L.jpg",
    link: "https://man7.org/tlpi/"
  },
  {
    title: "Effective TypeScript",
    description: "Best practices for TypeScript.",
    image: "https://covers.openlibrary.org/b/isbn/9781492053743-L.jpg",
    link: "https://openlibrary.org/isbn/9781492053743"
  },
  {
    title: "Programming Rust",
    description: "Fast and safe systems programming.",
    image: "https://covers.openlibrary.org/b/isbn/9781491927281-L.jpg",
    link: "https://openlibrary.org/isbn/9781491927281"
  },
  {
    title: "Clean Agile",
    description: "Back to basics of Agile.",
    image: "https://covers.openlibrary.org/b/isbn/9780135781869-L.jpg",
    link: "https://openlibrary.org/isbn/9780135781869"
  },
  {
    title: "Site Reliability Engineering",
    description: "How Google runs production systems.",
    image: "https://covers.openlibrary.org/b/isbn/9781491929124-L.jpg",
    link: "https://sre.google/books/"
  },
  {
    title: "Deep Learning",
    description: "Foundations of deep learning.",
    image: "https://covers.openlibrary.org/b/isbn/9780262035613-L.jpg",
    link: "https://www.deeplearningbook.org/"
  },
  {
    title: "Clean Code",
    description: "A Handbook of Agile Software Craftsmanship.",
    image: "https://covers.openlibrary.org/b/isbn/9780132350884-L.jpg",
    link: "https://openlibrary.org/isbn/9780132350884"
  },
  {
    title: "The Pragmatic Programmer",
    description: "Your Journey to Mastery.",
    image: "https://covers.openlibrary.org/b/isbn/9780201616224-L.jpg",
    link: "https://openlibrary.org/isbn/9780201616224"
  }
];

const booksPerPage = 10;
function load(page) {

    const container = document.querySelector("#books-container");
    container.innerHTML = "";

    const render = books.slice((page - 1) * booksPerPage, page * booksPerPage);
    render.forEach(book => {
        container.innerHTML += `
              <div class="col">
                <div class="card h-100 bg-light border-light">
                  <img src="${book.image}" class="card-img-top" alt="...">
                  <div class="card-body">
                    <h5 class="card-title">${book.title}</h5>
                    <p class="card-text">${book.description}</p>
                    <a href="${book.link}" class="btn btn-outline-primary" target= "_blank">Read Now</a>
                  </div>
                </div>
              </div>
        `;
    });
}






