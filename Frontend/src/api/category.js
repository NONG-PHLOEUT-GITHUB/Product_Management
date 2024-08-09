import http from './api'

export function fetchCategories(){
    return http.get('/categories/all-categories');
}