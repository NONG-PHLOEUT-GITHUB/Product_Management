import http from "./api";

export function fetchProducts() {
  return http.get("/products/all-products");
}

export function fetchProductByID(id) {
  return http.get(`/products/${id}`);
}
export function deleteProductByID(id) {
  return http.delete(`/products/delete/${id}`);
}

export function createProduct(data,productImages) {
  const formData = new FormData();
  // Append each key-value pair to the FormData object
  Object.entries(data).forEach(([key, value]) => {
    formData.append(key, value);
  });

  productImages.forEach((image, index) => {
    formData.append(`productImages[${index}]`, image);
  });

  return http.post("/products/create", formData, {
    headers: {
      "Content-Type": "multipart/form-data",
    },
  });
}
