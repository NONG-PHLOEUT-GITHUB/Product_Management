import http from './api'

export function fetchCategories(){
    return http.get('/categories/all-categories');
}
export function fetchCategory(id){
    return http.get(`/categories/${id}/category`);
}
export function deleteCategorie(id){
    return http.delete(`/categories/delete/${id}`);
}
export function createCategorie(data){
    return http.post('/categories/create',data);
}
