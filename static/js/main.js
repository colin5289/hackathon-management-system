// 主要的 JavaScript 功能

// 当文档加载完成后执行
document.addEventListener('DOMContentLoaded', function() {
    console.log('Flask 应用已加载');
    
    // 初始化所有功能
    initializeApp();
});

// 初始化应用
function initializeApp() {
    // API 测试按钮事件
    const testApiButton = document.getElementById('testApi');
    if (testApiButton) {
        testApiButton.addEventListener('click', testApiEndpoint);
    }
    
    // 添加平滑滚动
    addSmoothScrolling();
}

// 测试 API 端点
async function testApiEndpoint() {
    const button = document.getElementById('testApi');
    const resultDiv = document.getElementById('apiResult');
    
    // 显示加载状态
    button.disabled = true;
    button.innerHTML = '<span class="loading"></span> 测试中...';
    resultDiv.className = '';
    
    try {
        // 测试 GET API
        const response = await fetch('/api/hello');
        const data = await response.json();
        
        // 显示结果
        resultDiv.innerHTML = `
            <h6>API 响应结果:</h6>
            <pre>${JSON.stringify(data, null, 2)}</pre>
            <small class="text-muted">状态码: ${response.status}</small>
        `;
        
        // 测试 POST API
        setTimeout(async () => {
            try {
                const postResponse = await fetch('/api/echo', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        message: 'Hello from frontend!',
                        timestamp: new Date().toISOString()
                    })
                });
                
                const postData = await postResponse.json();
                
                resultDiv.innerHTML += `
                    <hr>
                    <h6>POST API 响应结果:</h6>
                    <pre>${JSON.stringify(postData, null, 2)}</pre>
                    <small class="text-muted">状态码: ${postResponse.status}</small>
                `;
                
            } catch (error) {
                resultDiv.innerHTML += `
                    <hr>
                    <div class="alert alert-danger">
                        POST API 测试失败: ${error.message}
                    </div>
                `;
            }
        }, 1000);
        
    } catch (error) {
        resultDiv.innerHTML = `
            <div class="alert alert-danger">
                API 测试失败: ${error.message}
            </div>
        `;
        resultDiv.className = 'error';
    } finally {
        // 恢复按钮状态
        button.disabled = false;
        button.innerHTML = '测试 API';
    }
}

// 添加平滑滚动效果
function addSmoothScrolling() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
}

// 工具函数：格式化日期
function formatDate(date) {
    return new Intl.DateTimeFormat('zh-CN', {
        year: 'numeric',
        month: '2-digit',
        day: '2-digit',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit'
    }).format(date);
}

// 工具函数：显示通知
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show position-fixed`;
    notification.style.top = '20px';
    notification.style.right = '20px';
    notification.style.zIndex = '9999';
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;
    
    document.body.appendChild(notification);
    
    // 自动移除通知
    setTimeout(() => {
        if (notification && notification.parentNode) {
            notification.parentNode.removeChild(notification);
        }
    }, 5000);
}

// 导出常用函数供其他脚本使用
window.FlaskApp = {
    testApiEndpoint,
    formatDate,
    showNotification
};
