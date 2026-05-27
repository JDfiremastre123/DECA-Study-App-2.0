//
//  MarketingDatabase.swift
//  DECA Study App
//
//  Contains all study terms and quiz questions for the Marketing cluster exam.
//

import Foundation

struct MarketingDatabase {

    // MARK: - Study Terms
    static let studyTerms: [StudyTerm] = [

        // ── Marketing Fundamentals ───────────────────────────────────────────
        StudyTerm(term: "Marketing",
                  definition: "The process of planning and executing the conception, pricing, promotion, and distribution of ideas, goods, and services to create exchanges that satisfy individual and organizational goals.",
                  example: "Nike markets its shoes through TV ads, social media influencers, and sponsoring athletes to build brand awareness and drive sales.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Marketing Mix (4 Ps)",
                  definition: "The combination of four elements — Product, Price, Place, and Promotion — that a business uses to market its goods or services.",
                  example: "Apple's marketing mix: premium products, high prices, Apple Stores and online (place), and sleek advertising campaigns (promotion).",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Target Market",
                  definition: "A specific group of consumers at whom a company aims its products and services.",
                  example: "Gatorade targets active athletes aged 13–35 who need electrolyte replenishment during physical activity.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Market Segmentation",
                  definition: "The process of dividing a broad market into distinct subsets of consumers who have common needs or characteristics.",
                  example: "McDonald's segments its market by age (Happy Meals for children, McCafé for adults) and by geography (regional menu items).",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Consumer Behavior",
                  definition: "The study of how individuals, groups, and organizations select, buy, use, and dispose of goods and services to satisfy their needs and wants.",
                  example: "Understanding that teens are influenced by social media led Nike to invest heavily in Instagram and TikTok marketing.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Brand",
                  definition: "A name, term, sign, symbol, design, or combination thereof that identifies a seller's products and differentiates them from competitors.",
                  example: "The Coca-Cola brand is recognized worldwide through its distinctive red color, script logo, and consistent messaging.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Brand Equity",
                  definition: "The commercial value that derives from consumer perception of the brand name of a particular product or service, rather than from the product or service itself.",
                  example: "Apple's brand equity allows it to charge premium prices; consumers pay more for an iPhone than comparably spec'd Android phones.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Value Proposition",
                  definition: "A statement that explains how a product solves customers' problems, delivers specific benefits, and why customers should buy from this company over the competition.",
                  example: "FedEx's value proposition: 'When it absolutely, positively has to be there overnight' emphasizes reliability and speed.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Unique Selling Proposition (USP)",
                  definition: "The factor or consideration presented by a seller as the reason that one product or service is different from and better than that of the competition.",
                  example: "M&M's USP: 'Melts in your mouth, not in your hands' — highlighting a functional benefit competitors could not match.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        StudyTerm(term: "Product Life Cycle",
                  definition: "The progression of a product through four stages: introduction, growth, maturity, and decline.",
                  example: "Smartphones are in the maturity stage — sales are high but growth is slowing as the market becomes saturated.",
                  category: "Marketing Fundamentals",
                  cluster: .marketing),

        // ── Market Research ──────────────────────────────────────────────────
        StudyTerm(term: "Market Research",
                  definition: "The process of gathering, analyzing, and interpreting information about a market, including consumers and competitors.",
                  example: "Before launching a new energy drink, a company surveys 1,000 college students to learn their flavor and packaging preferences.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Primary Data",
                  definition: "Data collected firsthand specifically for the current research purpose, such as through surveys, interviews, or focus groups.",
                  example: "A clothing retailer conducts a focus group of teenagers to learn which new styles they prefer before production.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Secondary Data",
                  definition: "Data that has already been collected and published by others, such as government reports, trade publications, or industry databases.",
                  example: "A startup uses U.S. Census data and industry reports to estimate the size of its potential market.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Survey",
                  definition: "A research method that gathers information by asking questions of a sample of people.",
                  example: "McDonald's sends post-visit digital surveys asking customers to rate their experience and food quality.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Focus Group",
                  definition: "A qualitative research method where a small group of people discuss a product, service, or concept under the guidance of a moderator.",
                  example: "Before releasing a new car model, Ford assembled a focus group to gauge reactions to the interior design.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Observation Research",
                  definition: "A research method in which researchers watch and record consumer behavior in natural settings without direct interaction.",
                  example: "Grocery stores use heat maps from security cameras to observe which aisles customers visit most frequently.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Random Sampling",
                  definition: "A sampling technique in which every member of the population has an equal chance of being selected for the study.",
                  example: "A school selects 50 students randomly from its entire enrollment to survey about cafeteria preferences.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Nonresponse Error",
                  definition: "A research bias that occurs when people who do not respond to a survey differ significantly from those who do, skewing results.",
                  example: "A political poll conducted by phone misses responses from young adults who mainly use cell phones, skewing results older.",
                  category: "Market Research",
                  cluster: .marketing),

        StudyTerm(term: "Measure of Central Tendency",
                  definition: "Statistical values — mean, median, and mode — used to describe the center point of a data set.",
                  example: "The average (mean) household income in a ZIP code helps a retailer decide if its price points are appropriate for that area.",
                  category: "Market Research",
                  cluster: .marketing),

        // ── Pricing ──────────────────────────────────────────────────────────
        StudyTerm(term: "Price",
                  definition: "The amount of money charged for a product or service, or the sum of the values that consumers exchange for the benefits of having or using the product.",
                  example: "Tesla set the price of the Model 3 at $40,000 to reach mass-market buyers while maintaining a premium image.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Penetration Pricing",
                  definition: "A pricing strategy in which a new product is priced low to attract customers and gain market share quickly.",
                  example: "Netflix launched at $7.99/month to quickly gain subscribers before gradually raising prices.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Skimming Pricing",
                  definition: "A strategy of setting a high price for a new product to 'skim' maximum revenue from early adopters before lowering the price.",
                  example: "Sony launched the PlayStation 5 at $499 to capture early adopters willing to pay a premium at launch.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Psychological Pricing",
                  definition: "A pricing strategy that uses prices ending in odd numbers (e.g., $9.99) to make products appear less expensive than they are.",
                  example: "Walmart prices items at $19.97 instead of $20.00 to make consumers perceive them as cheaper.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Break-Even Point",
                  definition: "The level of sales at which total revenue equals total costs, resulting in neither profit nor loss.",
                  example: "If a business has $50,000 in fixed costs and earns $10 profit per unit, it must sell 5,000 units to break even.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Fixed Costs",
                  definition: "Costs that do not change regardless of the level of production or sales, such as rent, salaries, and insurance.",
                  example: "A restaurant pays $5,000/month in rent whether it serves 100 or 1,000 meals — that is a fixed cost.",
                  category: "Pricing",
                  cluster: .marketing),

        StudyTerm(term: "Variable Costs",
                  definition: "Costs that change in proportion to the level of production or sales, such as raw materials and packaging.",
                  example: "A bakery's flour and butter costs rise during the holiday season as it produces more cakes.",
                  category: "Pricing",
                  cluster: .marketing),

        // ── Promotion & Advertising ──────────────────────────────────────────
        StudyTerm(term: "Promotion",
                  definition: "Any communication used to inform, persuade, or remind consumers about a product or service.",
                  example: "Coca-Cola's 'Share a Coke' campaign personalized bottles with names, driving both awareness and purchases.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Promotional Mix",
                  definition: "The combination of advertising, personal selling, sales promotion, and public relations a company uses to communicate with its target market.",
                  example: "A car dealership uses TV commercials (advertising), a showroom sales staff (personal selling), and end-of-year rebates (sales promotion).",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Advertising",
                  definition: "Paid, non-personal communication about a product, service, or company from an identified sponsor.",
                  example: "Apple's 'Think Different' campaign aired on TV and in magazines — paid and clearly identified as coming from Apple.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Public Relations (PR)",
                  definition: "Activities that promote a favorable image of a company or product without paid advertising, often through media coverage.",
                  example: "A company issues a press release about its charitable donations, gaining positive news coverage at no direct ad cost.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Sales Promotion",
                  definition: "Short-term incentives used to encourage the purchase or sale of a product, such as coupons, rebates, contests, and free samples.",
                  example: "Doritos offered free samples at college football games to introduce a new flavor and stimulate trial purchases.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Personal Selling",
                  definition: "Direct, face-to-face communication between a seller and a prospective buyer with the goal of making a sale.",
                  example: "An insurance agent meets clients individually to explain policy options and close sales — a classic personal selling scenario.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Endorsement",
                  definition: "A form of promotion in which a celebrity, expert, or satisfied customer publicly supports a product or service.",
                  example: "LeBron James endorsing Nike shoes lends credibility and aspirational appeal to the brand among basketball fans.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        StudyTerm(term: "Infomercial",
                  definition: "A long-form television commercial, typically 30 minutes, that presents detailed information about a product and urges viewers to purchase it.",
                  example: "The ShamWow and Snuggie became cultural phenomena largely through infomercials that demonstrated their products in detail.",
                  category: "Promotion & Advertising",
                  cluster: .marketing),

        // ── Distribution & Channel Management ───────────────────────────────
        StudyTerm(term: "Distribution Channel",
                  definition: "The path through which goods or services travel from producer to consumer, which may include wholesalers, distributors, and retailers.",
                  example: "A farmer sells crops → to a food distributor → to a grocery store → to the consumer (a 3-tier channel).",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Exclusive Distribution",
                  definition: "A distribution strategy in which a manufacturer grants only one retailer or distributor the right to sell the product in a specific geographic area.",
                  example: "Rolex grants exclusive distribution rights to select luxury jewelers; you cannot buy an authentic Rolex at a department store.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Intensive Distribution",
                  definition: "A strategy of placing a product in as many outlets as possible to maximize market coverage.",
                  example: "Coca-Cola uses intensive distribution — you can buy a Coke at gas stations, grocery stores, restaurants, vending machines, and more.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Selective Distribution",
                  definition: "A distribution strategy in which a producer uses a limited number of outlets in a given area to sell its products.",
                  example: "Levi's sells through select department stores and its own stores, but not at every clothing retailer.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Supply Chain",
                  definition: "The entire network of entities, processes, and resources involved in producing and delivering a product to the end customer.",
                  example: "Apple's supply chain spans component suppliers in Asia, assembly factories in China, and Apple Stores worldwide.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Electronic Data Interchange (EDI)",
                  definition: "The electronic exchange of business documents, such as purchase orders and invoices, between organizations in a standardized format.",
                  example: "Walmart uses EDI to automatically share point-of-sale data with suppliers so they can restock shelves efficiently.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        StudyTerm(term: "Logistics",
                  definition: "The planning and management of the flow of goods, information, and resources between the point of origin and the point of consumption.",
                  example: "Amazon's logistics network — including fulfillment centers, delivery vans, and drones — ensures two-day delivery.",
                  category: "Distribution & Channels",
                  cluster: .marketing),

        // ── Product Management ───────────────────────────────────────────────
        StudyTerm(term: "Product Mix",
                  definition: "The total assortment of products that a company offers for sale.",
                  example: "Procter & Gamble's product mix includes detergents (Tide), shampoos (Head & Shoulders), and razors (Gillette).",
                  category: "Product Management",
                  cluster: .marketing),

        StudyTerm(term: "Product Line",
                  definition: "A group of closely related products sold by the same company that serve similar functions or are sold to the same customer groups.",
                  example: "Apple's iPhone line includes the iPhone 14, 14 Plus, 14 Pro, and 14 Pro Max — different versions serving different segments.",
                  category: "Product Management",
                  cluster: .marketing),

        StudyTerm(term: "Product Differentiation",
                  definition: "The process of distinguishing a product from competitors by emphasizing unique features, quality, design, or other attributes.",
                  example: "Dyson differentiates its vacuums with bagless cyclone technology and premium design, justifying a higher price point.",
                  category: "Product Management",
                  cluster: .marketing),

        StudyTerm(term: "Product Positioning",
                  definition: "The process of creating a specific image or perception of a product in the minds of consumers relative to competing products.",
                  example: "Volvo is positioned in consumers' minds as the 'safe' car brand, a perception built over decades of advertising.",
                  category: "Product Management",
                  cluster: .marketing),

        StudyTerm(term: "New Product Development",
                  definition: "The complete process from idea generation to commercialization used to bring a new product to market.",
                  example: "Google's development of Google Maps involved idea generation, prototyping, beta testing, and finally a public launch.",
                  category: "Product Management",
                  cluster: .marketing),

        StudyTerm(term: "Product Mix Strategy",
                  definition: "The way a business makes changes in the amount or type of goods or services it offers.",
                  example: "McDonald's expanded its product mix strategy by adding McCafé coffee drinks to attract morning commuters.",
                  category: "Product Management",
                  cluster: .marketing),

        // ── Consumer & Business Law ──────────────────────────────────────────
        StudyTerm(term: "Cooling-Off Rule",
                  definition: "An FTC regulation that gives consumers three business days to cancel a sale made at their home or a location other than the seller's permanent place of business.",
                  example: "A door-to-door salesperson sells a homeowner a $2,000 vacuum; the homeowner has 3 days to cancel the purchase under the FTC's cooling-off rule.",
                  category: "Business Law & Ethics",
                  cluster: .marketing),

        StudyTerm(term: "Federal Trade Commission (FTC)",
                  definition: "A U.S. government agency that enforces consumer protection laws and prevents anticompetitive business practices.",
                  example: "The FTC ordered a company to stop making false health claims about its supplements in ads.",
                  category: "Business Law & Ethics",
                  cluster: .marketing),

        StudyTerm(term: "Intellectual Property",
                  definition: "Creations of the mind — including inventions, literary and artistic works, symbols, names, and images — protected by law.",
                  example: "Starbucks' mermaid logo is trademarked intellectual property; another coffee shop cannot use a similar design.",
                  category: "Business Law & Ethics",
                  cluster: .marketing),

        StudyTerm(term: "Ethics",
                  definition: "Moral principles and values that govern the behavior of a person or a business in its relationships with others.",
                  example: "A salesperson chooses not to mislead a customer about a product's features, even if it means losing the sale — an ethical decision.",
                  category: "Business Law & Ethics",
                  cluster: .marketing),

        // ── Digital Marketing ────────────────────────────────────────────────
        StudyTerm(term: "Digital Marketing",
                  definition: "The promotion of products and services using digital technologies and channels, including websites, social media, email, and search engines.",
                  example: "Spotify uses targeted Spotify ads and social media promotions to convert free users into paid Premium subscribers.",
                  category: "Digital Marketing",
                  cluster: .marketing),

        StudyTerm(term: "Search Engine Optimization (SEO)",
                  definition: "The practice of optimizing web content so that it ranks higher in search engine results pages, increasing organic traffic.",
                  example: "A local bakery uses keywords like 'best croissant Minneapolis' on its website to appear at the top of Google searches.",
                  category: "Digital Marketing",
                  cluster: .marketing),

        StudyTerm(term: "Social Media Marketing",
                  definition: "The use of social media platforms to promote products, build brand awareness, and engage with customers.",
                  example: "Wendy's Twitter roasts competitors and posts memes, generating millions of organic impressions at minimal cost.",
                  category: "Digital Marketing",
                  cluster: .marketing),

        StudyTerm(term: "E-Commerce",
                  definition: "The buying and selling of goods and services over the internet.",
                  example: "Amazon generated over $500 billion in e-commerce sales in 2023, selling everything from books to groceries online.",
                  category: "Digital Marketing",
                  cluster: .marketing),

        // ── Customer Relations ───────────────────────────────────────────────
        StudyTerm(term: "Customer Relationship Management (CRM)",
                  definition: "A strategy and system for managing a company's interactions with current and potential customers to improve relationships and drive sales growth.",
                  example: "Salesforce CRM lets a sales team track every customer interaction, follow-up date, and deal stage in one place.",
                  category: "Customer Relations",
                  cluster: .marketing),

        StudyTerm(term: "Customer Satisfaction",
                  definition: "A measure of how products and services supplied by a company meet or exceed customer expectations.",
                  example: "Amazon's easy return policy and fast shipping consistently generate high customer satisfaction scores.",
                  category: "Customer Relations",
                  cluster: .marketing),

        StudyTerm(term: "Empathy",
                  definition: "The ability to understand and share the feelings of another — a key skill in customer service and personal selling.",
                  example: "A customer service rep saying 'I understand how frustrating that must be' demonstrates empathy before solving the problem.",
                  category: "Customer Relations",
                  cluster: .marketing),

        StudyTerm(term: "Goodwill",
                  definition: "The favorable reputation or perception a business has built with its customers, community, or the public through positive interactions.",
                  example: "Chick-fil-A's consistently polite staff and community involvement have built significant goodwill, driving customer loyalty.",
                  category: "Customer Relations",
                  cluster: .marketing),
    ]

    // MARK: - Quiz Questions
    static let quizQuestions: [QuizQuestion] = [

        QuizQuestion(
            question: "The combination of Product, Price, Place, and Promotion used to market goods or services is called the:",
            options: ["Marketing Concept", "Marketing Mix", "Promotional Mix", "Distribution Strategy"],
            correctIndex: 1,
            explanation: "The Marketing Mix (4 Ps) — Product, Price, Place, and Promotion — is the foundation of any marketing strategy. Marketers adjust each element to reach their target market effectively.",
            cluster: .marketing),

        QuizQuestion(
            question: "What do businesses primarily expect to earn when they set prices on goods and services?",
            options: ["Quotas", "Salaries", "Profits", "Payments"],
            correctIndex: 2,
            explanation: "Businesses set prices to generate profits — the revenue remaining after all costs are covered. Profit is the primary financial goal of a for-profit business.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company divides its market into groups based on age, income, and lifestyle. This process is called:",
            options: ["Product Positioning", "Market Segmentation", "Brand Equity", "Target Marketing"],
            correctIndex: 1,
            explanation: "Market segmentation divides a broad market into smaller, distinct groups (segments) that share common characteristics such as demographics, psychographics, or behavior.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which distribution strategy places a product in as many retail outlets as possible?",
            options: ["Exclusive Distribution", "Selective Distribution", "Intensive Distribution", "Direct Distribution"],
            correctIndex: 2,
            explanation: "Intensive distribution maximizes market coverage by making a product available in virtually every possible outlet. Convenience goods like soda and gum commonly use this strategy.",
            cluster: .marketing),

        QuizQuestion(
            question: "The FTC regulation that allows consumers to cancel a door-to-door sale within three days is called the:",
            options: ["Lemon Law", "Truth in Lending Act", "Cooling-Off Rule", "Fair Trade Regulation"],
            correctIndex: 2,
            explanation: "The FTC's Cooling-Off Rule gives consumers three business days to cancel certain sales made outside a seller's permanent place of business, protecting against high-pressure sales tactics.",
            cluster: .marketing),

        QuizQuestion(
            question: "Data collected firsthand for a specific research purpose — such as through surveys or focus groups — is called:",
            options: ["Secondary Data", "Observational Data", "Primary Data", "Quantitative Data"],
            correctIndex: 2,
            explanation: "Primary data is gathered directly by the researcher for a specific purpose. While more expensive and time-consuming than secondary data, it is tailored to the exact research need.",
            cluster: .marketing),

        QuizQuestion(
            question: "A survey question that asks 'How would you rate our customer service AND product quality?' is problematic because it:",
            options: ["Uses unfamiliar terminology", "Asks about two topics at once", "Influences the respondent's opinion", "Is open-ended"],
            correctIndex: 1,
            explanation: "A double-barreled question asks about two different topics simultaneously, making it impossible for respondents to answer accurately. Each survey question should address only one topic.",
            cluster: .marketing),

        QuizQuestion(
            question: "Rent, salaries, and advertising budgets are examples of:",
            options: ["Variable Costs", "Cost of Goods Sold", "Fixed Costs", "Operating Expenses"],
            correctIndex: 3,
            explanation: "Rent, salaries, and advertising are operating expenses — costs incurred in running the day-to-day business that are not directly tied to producing goods. (Note: They can also be categorized as fixed costs.)",
            cluster: .marketing),

        QuizQuestion(
            question: "Which pricing strategy sets a very low initial price to quickly capture market share?",
            options: ["Skimming Pricing", "Psychological Pricing", "Penetration Pricing", "Premium Pricing"],
            correctIndex: 2,
            explanation: "Penetration pricing uses a low introductory price to attract price-sensitive customers and gain market share rapidly. Once established, prices may be raised gradually.",
            cluster: .marketing),

        QuizQuestion(
            question: "Volvo consistently emphasizing safety in all its advertising is an example of:",
            options: ["Product Differentiation", "Market Segmentation", "Product Positioning", "Brand Extension"],
            correctIndex: 2,
            explanation: "Product positioning creates a specific image in consumers' minds. Volvo has positioned itself as 'the safe car' through decades of consistent safety-focused messaging.",
            cluster: .marketing),

        QuizQuestion(
            question: "What is the purpose of an endorsement in advertising?",
            options: ["To set a low price for a product", "To distribute products through retailers", "To have a celebrity or expert support a product publicly", "To segment the target market"],
            correctIndex: 2,
            explanation: "Endorsements leverage the credibility, fame, or expertise of a person to positively influence consumers' perceptions of a product or brand.",
            cluster: .marketing),

        QuizQuestion(
            question: "Electronic data interchange (EDI) between suppliers, warehouses, and store checkouts is used to:",
            options: ["Conduct market research", "Share information along the supply chain", "Create digital advertising campaigns", "Process customer complaints"],
            correctIndex: 1,
            explanation: "EDI enables the automatic electronic exchange of business documents between trading partners, streamlining supply chain operations and improving inventory management.",
            cluster: .marketing),

        QuizQuestion(
            question: "A small focus group of consumers is brought together to discuss reactions to a new product concept. This is an example of:",
            options: ["Quantitative Research", "Secondary Research", "Observation Research", "Qualitative Primary Research"],
            correctIndex: 3,
            explanation: "A focus group is a qualitative primary research method. It provides in-depth insights into consumer opinions, feelings, and motivations that surveys alone cannot capture.",
            cluster: .marketing),

        QuizQuestion(
            question: "The stage in the product life cycle where sales are highest but growth is slowing is called:",
            options: ["Introduction", "Growth", "Maturity", "Decline"],
            correctIndex: 2,
            explanation: "In the maturity stage, sales plateau at their peak as the market becomes saturated. Competition is most intense here, and companies focus on maintaining market share.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which of the following is the best example of a sales promotion?",
            options: ["A TV commercial for a new car", "A press release about a product recall", "A buy-one-get-one-free coupon", "A salesperson calling on a customer"],
            correctIndex: 2,
            explanation: "Sales promotions are short-term incentives (coupons, rebates, contests, samples) designed to stimulate immediate purchase. They differ from advertising (long-term awareness) and personal selling.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company that uses government census reports and industry publications to understand its market is using:",
            options: ["Primary Data", "Observational Data", "Secondary Data", "Experimental Data"],
            correctIndex: 2,
            explanation: "Secondary data has already been collected by others. It is less costly than primary research but may not be perfectly tailored to the researcher's specific needs.",
            cluster: .marketing),

        QuizQuestion(
            question: "The path a product takes from manufacturer to the final consumer is called the:",
            options: ["Supply Route", "Logistics Flowchart", "Distribution Channel", "Marketing Pipeline"],
            correctIndex: 2,
            explanation: "A distribution channel (also called a marketing channel) includes all the intermediaries — wholesalers, distributors, retailers — through which goods pass on the way to the end consumer.",
            cluster: .marketing),

        QuizQuestion(
            question: "Apple charges $999 for a new iPhone at launch to capture early adopters, then gradually lowers the price. This is an example of:",
            options: ["Penetration Pricing", "Price Skimming", "Psychological Pricing", "Competitive Pricing"],
            correctIndex: 1,
            explanation: "Price skimming sets a high introductory price to maximize revenue from consumers willing to pay a premium. As the market matures and competition increases, the price is reduced.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which of the following best describes brand equity?",
            options: ["The total sales revenue of a brand", "The legal trademark protection of a brand name", "The added value consumers assign to a brand beyond its functional features", "The number of products in a brand's product line"],
            correctIndex: 2,
            explanation: "Brand equity is the premium a company generates from a product with a recognizable name compared to a generic equivalent. Strong brand equity allows premium pricing and greater customer loyalty.",
            cluster: .marketing),

        QuizQuestion(
            question: "A survey research error caused by people who choose not to respond differing significantly from those who do respond is called:",
            options: ["Sampling Error", "Response Bias", "Nonresponse Error", "Leading Question Bias"],
            correctIndex: 2,
            explanation: "Nonresponse error skews results when people who don't respond differ systematically from respondents. For example, unhappy customers may refuse surveys, making satisfaction scores artificially high.",
            cluster: .marketing),

        QuizQuestion(
            question: "The statement 'The average U.S. male buys frozen pizza four times per month' is an example of a:",
            options: ["Mode", "Measure of Central Tendency", "Sampling Method", "Product Positioning Statement"],
            correctIndex: 1,
            explanation: "A measure of central tendency (mean, median, or mode) describes the center of a data set. The average (mean) of four purchases per month is such a measure.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which marketing function helps a business answer 'Who are our customers and what do they want?'",
            options: ["Distribution", "Pricing", "Market Research", "Product Development"],
            correctIndex: 2,
            explanation: "Market research is the function that gathers and analyzes information about customers, competitors, and the marketplace to guide strategic decisions.",
            cluster: .marketing),

        QuizQuestion(
            question: "Coca-Cola making its products available in grocery stores, restaurants, vending machines, and corner stores worldwide best illustrates:",
            options: ["Selective Distribution", "Exclusive Distribution", "Direct Distribution", "Intensive Distribution"],
            correctIndex: 3,
            explanation: "Intensive distribution places a product in the maximum number of outlets. Convenience goods like soft drinks use this to ensure consumers can find them anywhere they shop.",
            cluster: .marketing),

        QuizQuestion(
            question: "A business's total assortment of product lines and items it offers for sale is called its:",
            options: ["Product Line", "Product Depth", "Product Mix", "Product Portfolio"],
            correctIndex: 2,
            explanation: "The product mix (also called the product assortment) refers to all products a company sells. Width refers to the number of lines; depth refers to variants within each line.",
            cluster: .marketing),

        QuizQuestion(
            question: "An activity that promotes a favorable image of a company through media coverage without paid advertising is:",
            options: ["Sales Promotion", "Personal Selling", "Advertising", "Public Relations"],
            correctIndex: 3,
            explanation: "Public relations (PR) builds goodwill through unpaid media exposure — press releases, event sponsorships, and community involvement — rather than purchased advertising space.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company prices its new running shoes at $99.99 instead of $100.00. This pricing strategy is called:",
            options: ["Penetration Pricing", "Odd-Even Pricing (Psychological Pricing)", "Skimming Pricing", "Competitive Pricing"],
            correctIndex: 1,
            explanation: "Psychological (odd-even) pricing uses prices just below a round number to make products seem cheaper. Research shows consumers perceive $99.99 as significantly less than $100.",
            cluster: .marketing),

        QuizQuestion(
            question: "A shoe store sells only Nike products and has an agreement preventing competitors from selling Nike in its territory. This is an example of:",
            options: ["Intensive Distribution", "Direct Distribution", "Exclusive Distribution", "Selective Distribution"],
            correctIndex: 2,
            explanation: "Exclusive distribution grants one retailer the sole right to sell a product in a defined area. It protects the retailer's investment in promoting the brand and maintains a premium image.",
            cluster: .marketing),

        QuizQuestion(
            question: "The process of creating a specific image or perception of a product relative to competitors in consumers' minds is called:",
            options: ["Brand Extension", "Market Segmentation", "Product Differentiation", "Product Positioning"],
            correctIndex: 3,
            explanation: "Positioning shapes how consumers think about a product relative to competitors. A clear positioning statement guides all marketing messages and helps the brand occupy a distinct place in the market.",
            cluster: .marketing),

        QuizQuestion(
            question: "Empathy is MOST important in which business function?",
            options: ["Supply Chain Management", "Customer Service and Personal Selling", "Financial Analysis", "Product Development"],
            correctIndex: 1,
            explanation: "Empathy — understanding the customer's feelings and perspective — is a core competency in customer service and personal selling. It builds trust, resolves conflicts, and fosters loyalty.",
            cluster: .marketing),

        QuizQuestion(
            question: "What is the primary goal of search engine optimization (SEO)?",
            options: ["To run paid advertisements on Google", "To build a company's social media following", "To improve a website's ranking in organic search results", "To design an attractive company website"],
            correctIndex: 2,
            explanation: "SEO optimizes website content, structure, and links so search engines rank it higher organically (without paying for ads), driving more free traffic from relevant searches.",
            cluster: .marketing),

        QuizQuestion(
            question: "A business must sell 2,000 units before it makes any profit. This point is called the:",
            options: ["Profit Margin", "Return on Investment", "Break-Even Point", "Variable Cost Threshold"],
            correctIndex: 2,
            explanation: "The break-even point is the sales volume at which total revenue equals total costs. Below it, the business loses money; above it, it earns a profit.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which of the following is an example of a leading question in a survey?",
            options: ["'How often do you visit our store each month?'", "'Do you agree that our new policy wastes customers' time?'", "'What is your age range?'", "'Which product features are most important to you?'"],
            correctIndex: 1,
            explanation: "A leading question contains a bias that suggests the desired answer. 'Do you agree that...' prompts respondents to agree, skewing results and undermining research validity.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which element of the promotional mix involves direct, face-to-face communication between a seller and a buyer?",
            options: ["Advertising", "Public Relations", "Sales Promotion", "Personal Selling"],
            correctIndex: 3,
            explanation: "Personal selling is the only element of the promotional mix involving direct, two-way, real-time communication. It is highly effective for complex or high-value products requiring customized pitches.",
            cluster: .marketing),

        QuizQuestion(
            question: "Walmart automatically notifying suppliers of low inventory through computer systems is an example of:",
            options: ["Social Media Marketing", "Supply Chain Disruption", "Electronic Data Interchange (EDI)", "Customer Relationship Management"],
            correctIndex: 2,
            explanation: "EDI enables automated electronic information sharing between supply chain partners. Walmart's use of EDI revolutionized retail supply chain efficiency by eliminating manual reorder processes.",
            cluster: .marketing),

        QuizQuestion(
            question: "The complete assortment of products a company offers is called the product mix. The variety of items within each product line is called:",
            options: ["Product Width", "Product Depth", "Product Breadth", "Product Scope"],
            correctIndex: 1,
            explanation: "Product depth refers to the number of variations (sizes, colors, flavors) within a single product line. Wide depth gives consumers many choices within a category.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which of the following is the BEST way for employees to communicate respectfully with coworkers?",
            options: ["Send group emails to avoid one-on-one conversations", "Think carefully about what to say before speaking", "Always agree with colleagues to prevent conflict", "Speak quickly to get your point across first"],
            correctIndex: 1,
            explanation: "Effective workplace communication requires thinking before speaking — choosing words carefully, being clear, and considering how the message will be received promotes respectful, productive dialogue.",
            cluster: .marketing),

        QuizQuestion(
            question: "A business that fails to maintain positive customer/client relations is most likely to experience:",
            options: ["Increased employee turnover", "A decrease in sales", "Lower production costs", "Reduced advertising expenses"],
            correctIndex: 1,
            explanation: "Poor customer relations erode loyalty and trust, causing customers to switch to competitors. This directly results in declining sales, which is the most immediate and measurable impact.",
            cluster: .marketing),

        QuizQuestion(
            question: "M&M's slogan 'Melts in your mouth, not in your hands' is an example of a:",
            options: ["Brand Extension", "Product Positioning Statement", "Unique Selling Proposition", "Distribution Strategy"],
            correctIndex: 2,
            explanation: "A Unique Selling Proposition (USP) highlights a specific benefit that differentiates a product from competitors. M&M's USP emphasizes a functional benefit no competitor could easily replicate.",
            cluster: .marketing),

        QuizQuestion(
            question: "Point-of-sale scanners used to track which products customers buy are an example of what data-collection method?",
            options: ["Telephone Survey", "Indirect Mechanical Observation", "Personal Interview", "Online Focus Group"],
            correctIndex: 1,
            explanation: "Point-of-sale scanners are mechanical observation tools that record actual purchase behavior without directly involving the consumer. The data collected is objective and continuous.",
            cluster: .marketing),

        QuizQuestion(
            question: "A customer who buys products based on an emotional connection to a brand rather than price is demonstrating:",
            options: ["Rational Buying Motive", "Price Sensitivity", "Brand Loyalty", "Selective Distribution"],
            correctIndex: 2,
            explanation: "Brand loyalty occurs when consumers consistently prefer one brand over competitors due to positive experiences, emotional attachment, or perceived superior quality, making them less price-sensitive.",
            cluster: .marketing),

        QuizQuestion(
            question: "The progression of a product from launch through growth, maturity, and decline is known as the:",
            options: ["Product Development Cycle", "Product Life Cycle", "Marketing Funnel", "Product Positioning Map"],
            correctIndex: 1,
            explanation: "The product life cycle describes how sales and profits evolve over a product's market life. Understanding which stage a product is in helps marketers adjust pricing, promotion, and distribution strategies.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company emails past customers exclusive discount codes for their birthdays. This is an example of:",
            options: ["Public Relations", "Customer Relationship Management (CRM)", "Penetration Pricing", "Market Segmentation"],
            correctIndex: 1,
            explanation: "CRM involves using data about customer interactions and preferences to build personalized, long-term relationships. Personalized birthday offers strengthen loyalty and encourage repeat purchases.",
            cluster: .marketing),

        QuizQuestion(
            question: "The process of creating a consistent and favorable reputation with the community and public is called:",
            options: ["Advertising", "Sales Promotion", "Goodwill Building", "Personal Selling"],
            correctIndex: 2,
            explanation: "Goodwill is the positive reputation a business builds through quality products, community involvement, ethical behavior, and excellent service. It has real monetary value and drives customer loyalty.",
            cluster: .marketing),

        QuizQuestion(
            question: "Netflix lowering its subscription price to $6.99/month to attract budget-conscious consumers is an example of:",
            options: ["Price Skimming", "Psychological Pricing", "Penetration Pricing", "Premium Pricing"],
            correctIndex: 2,
            explanation: "Penetration pricing uses a low price to enter a market or attract new segments. Netflix has used this strategy to grow market share in price-sensitive demographics.",
            cluster: .marketing),

        QuizQuestion(
            question: "A business uses Instagram Reels and TikTok videos to showcase its products to teenagers. This is an example of:",
            options: ["Public Relations", "Traditional Advertising", "Social Media Marketing", "Personal Selling"],
            correctIndex: 2,
            explanation: "Social media marketing uses platforms like Instagram, TikTok, and Twitter to engage target audiences. It is especially effective for reaching younger demographics where they spend significant time.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which research method gives the deepest qualitative insights into WHY consumers behave a certain way?",
            options: ["Online Survey", "Focus Group", "Point-of-Sale Observation", "Secondary Data Analysis"],
            correctIndex: 1,
            explanation: "Focus groups allow a moderator to probe responses, follow up on surprising answers, and explore emotional motivations — providing depth of understanding that structured surveys cannot achieve.",
            cluster: .marketing),

        QuizQuestion(
            question: "Which element of the marketing mix is MOST directly responsible for generating revenue?",
            options: ["Product", "Promotion", "Place", "Price"],
            correctIndex: 3,
            explanation: "Price is the only revenue-generating element of the marketing mix. Product, Place, and Promotion represent costs. Setting the right price is critical to profitability.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company discovers that the same customers keep returning to buy its products over competitors. This behavior is called:",
            options: ["Market Penetration", "Product Positioning", "Brand Loyalty", "Consumer Segmentation"],
            correctIndex: 2,
            explanation: "Brand loyalty reflects a strong, favorable attitude toward a brand that results in consistent repeat purchases. Companies invest heavily in building loyalty because retaining customers is more cost-effective than acquiring new ones.",
            cluster: .marketing),

        QuizQuestion(
            question: "Amazon using delivery drones and fulfillment centers to get packages to customers is part of which marketing function?",
            options: ["Promotion", "Pricing", "Product Development", "Distribution/Logistics"],
            correctIndex: 3,
            explanation: "Distribution and logistics involve the physical movement of products from producer to consumer. Amazon's logistics network is a key competitive advantage enabling its fast delivery promise.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company gathers 'Age, income, and geographic location' data about potential customers. This data is used to:",
            options: ["Price the product", "Identify the target market through segmentation", "Develop the promotional mix", "Choose a distribution strategy"],
            correctIndex: 1,
            explanation: "Demographic and geographic data is the foundation of market segmentation. Knowing who potential customers are helps companies design products and messages that resonate with specific groups.",
            cluster: .marketing),

        QuizQuestion(
            question: "When marketers communicate information about a product to inform, persuade, or remind consumers, they are using which element of the marketing mix?",
            options: ["Product", "Price", "Place", "Promotion"],
            correctIndex: 3,
            explanation: "Promotion encompasses all communications used to create awareness, interest, and desire for a product. It includes advertising, PR, sales promotion, and personal selling.",
            cluster: .marketing),

        QuizQuestion(
            question: "The practice of optimizing website content to rank higher in Google search results WITHOUT paying for ads is called:",
            options: ["Pay-Per-Click Advertising", "Social Media Marketing", "Search Engine Optimization (SEO)", "Content Syndication"],
            correctIndex: 2,
            explanation: "SEO improves organic (unpaid) search rankings through keyword optimization, quality content, and technical website improvements. Unlike paid search ads, SEO benefits compound over time.",
            cluster: .marketing),

        QuizQuestion(
            question: "A company that prices identical shampoo bottles at $3.99 in drug stores but $12.99 at luxury spas is using:",
            options: ["Penetration Pricing", "Psychological Pricing", "Value-Based Pricing", "Price Discrimination"],
            correctIndex: 3,
            explanation: "Price discrimination charges different prices to different market segments for the same product. Airlines, hotels, and many consumer goods companies use this strategy to maximize revenue across segments.",
            cluster: .marketing),
    ]
}
