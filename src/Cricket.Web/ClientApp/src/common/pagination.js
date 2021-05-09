const getRange = (start, end, step) => {
    const range = [];
    if (step === null || typeof (step) === 'undefined') {
        step = 1;
    }
    if (end < start) {
        step = -step;
    }
    while (step > 0 ? end >= start : end <= start) {
        range.push(start);
        start += step;
    }
    return range;
}

export const getPager = (
    totalItems,
    currentPage = 1,
    pageSize = 10,
    typeName = 'row',
    typeNamePlural = 'rows') => {
    // Calculate total pages
    const totalPages = Math.ceil(totalItems / pageSize);

    var startPage = 0, endPage = 0;

    if (totalPages <= 10) {
        // Less than 10 total pages so show all
        startPage = 1;
        endPage = totalPages;
    } else {
        // More than 10 total pages so calculate start and end pages
        if (currentPage <= 6) {
            startPage = 1;
            endPage = 10;
        } else if (currentPage + 4 >= totalPages) {
            startPage = totalPages - 9;
            endPage = totalPages;
        } else {
            startPage = currentPage - 5;
            endPage = currentPage + 4;
        }
    }

    // Calculate start and end item indexes
    const startIndex = (currentPage - 1) * pageSize;
    const endIndex = Math.min(startIndex + pageSize - 1, totalItems - 1);

    // Create an array of available pages
    const pages = getRange(startPage, endPage, 1);

    // Compose pager summary
    let pagerSummary = (startIndex + 1) + ' ';
    pagerSummary += ((startIndex + 1) !== (endIndex + 1) ? 'to' : '') + ' ';
    pagerSummary += ((startIndex + 1) !== (endIndex + 1) ? (endIndex + 1 + '') : '') + ' ';
    pagerSummary += 'of ' + totalItems + ' ' + (totalItems === 1 ? typeName : typeNamePlural);

    return {
        totalItems: totalItems,
        currentPage: currentPage,
        pageSize: pageSize,
        totalPages: totalPages,
        startPage: startPage,
        endPage: endPage,
        startIndex: startIndex,
        endIndex: endIndex,
        pages: pages,
        pagerSummary: pagerSummary
    };
};
